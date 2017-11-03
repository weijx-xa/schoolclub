package com.watermelon.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.watermelon.pojo.Question;
import com.watermelon.pojo.User;
import com.watermelon.service.QuestionService;
import com.watermelon.service.UserService;
import com.watermelon.utils.HttpUtils;
import com.watermelon.utils.JedisUtils;
import com.watermelon.utils.JsonObject;
import com.watermelon.utils.JsonUtils;
import com.watermelon.utils.RegexpUtils;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private WebUtils webUtils;
	
	@Autowired
	private QuestionService questionService;

	@RequestMapping("/login")
	public ModelAndView Login() {
		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView Login(String account, String password, HttpServletRequest request,
			HttpServletResponse response) {
		if (StringUtils.isAnyEmpty(account, password)) {
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "所填数据不能为null");
			return modelAndView;
		}
		User user = new User();
		if (RegexpUtils.isHardRegexpValidate(account, RegexpUtils.EMAIL_REGEXP)) {
			user.setEmail(account);
		} else if (RegexpUtils.isHardRegexpValidate(account, RegexpUtils.PHONE_REGEXP)) {
			user.setPhoneNum(account);
		} else {
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "账号不符合规范");
			return modelAndView;
		}
		List<User> userList= userService.selectList(user);
		if(userList==null||userList.size()==0)
		{
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "无此账号");
			return modelAndView;
		}
		user=userList.get(0);
		String salt = user.getSalt();
		String newPassord=DigestUtils.md5Hex(password + salt);
		if (newPassord.equals(user.getPassword())) {
			webUtils.setSession(user);
			ModelAndView modelAndView = new ModelAndView("redirect:/");
			return modelAndView;
		} else {
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "账号或者密码错误");
			return modelAndView;
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(String email, String password, String code, HttpServletRequest request,
			HttpServletResponse response) {
		if (StringUtils.isAnyEmpty(email, password, code)) {
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "所填数据不能为null");
			return modelAndView;
		}
		if (!HttpUtils.checkEmailCode(request.getSession(), code,email)) {
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "验证码不正确");
			return modelAndView;
		}
		
		User user=new User();
		user.setEmail(email);
		if(userService.isExisted(user))
		{
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "该用户已存在");
			return modelAndView;
		}
		String salt=UUID.randomUUID().toString();
		user.setIsDeleted(false);
		user.setSalt(salt);
		password=DigestUtils.md5Hex(password + salt);
		user.setPassword(password);
		user.setCreateTime(new Date());
		user.setIsDeleted(false);
		userService.insert(user);
		User param=new User();
		param.setEmail(email);
		param=userService.selectList(param).get(0);
		webUtils.setSession(param);
		ModelAndView modelAndView = new ModelAndView("personInfo");
		return modelAndView;
	}
	@RequestMapping("info")
	public ModelAndView personInfo()
	{
		ModelAndView modelAndView = new ModelAndView("personInfo");
		return modelAndView;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		request.getSession().setAttribute("user",null);
		request.getSession().invalidate();
		ModelAndView modelAndView=new ModelAndView("login");
		return modelAndView;
	}
	
	
	/**
	 * 报名活动
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/joinClub", method = RequestMethod.GET)
	public ModelAndView joinClub(User user) {
		ModelAndView modelAndView = new ModelAndView("joinClub");
		return modelAndView;
	}

	@RequestMapping(value = "/followClub", method = RequestMethod.GET)
	public ModelAndView followClub(User user) {
		ModelAndView modelAndView = new ModelAndView("followClub");
		return modelAndView;
	}

	/**
	 * 报名活动
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/joinAc", method = RequestMethod.GET)
	public ModelAndView joinAc(User user) {
		ModelAndView modelAndView = new ModelAndView("joinAc");
		return modelAndView;
	}

	@RequestMapping(value = "/followAc", method = RequestMethod.GET)
	public ModelAndView followAc(User user) {
		ModelAndView modelAndView = new ModelAndView("followAc");
		return modelAndView;
	}

	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public ModelAndView message() {
		ModelAndView modelAndView = new ModelAndView("message");
		return modelAndView;
	}

	
	
	@RequestMapping(value = "/clubMessage", method = RequestMethod.GET)
	public ModelAndView clubMessage() {
		ModelAndView modelAndView = new ModelAndView("clubMessage");
		return modelAndView;
	}
	
	@RequestMapping(value = "/getCommonMessage", method = RequestMethod.POST)
	public @ResponseBody String getCommonMessage(Integer pageNum){
		User user=(User) webUtils.getSession("user");
		if(user==null)
		{
			return JsonObject.toErrorJson("请先登录");
		}
		if(pageNum==null)
		{
			pageNum=1;
		}
		//查找当前用户收到的普通消息
		Long userId=user.getId();
		Set<String> datas = JedisUtils.smembers("notification_" + user.getId());
		if (datas == null || datas.size() < 1) {
			return JsonObject.toSuccessJson(null);
		}
		List<Object> list = new ArrayList<>();
		for (String str : datas) {
			Object obj = JsonUtils.toBean(str, Object.class);
			list.add(obj);
		}
		return JsonObject.toSuccessJson(list);
	}
	
	@RequestMapping("delMessage")
	public ModelAndView delMessage(){
		User user=(User) webUtils.getSession("user");
		if(user==null)
		{
			ModelAndView modelAndView =new ModelAndView("login");
			modelAndView.addObject("message", "请先登录");
			return modelAndView;
		}
		JedisUtils.del("notification_"+user.getId());
		ModelAndView modelAndView=new ModelAndView("message");
		return modelAndView;
	}
	
	public @ResponseBody String getClubMessage(Integer pageNum){
	
		User user=(User) webUtils.getSession("user");
		if(user==null)
		{
			return JsonObject.toErrorJson("请先登录");
		}
		if(pageNum==null)
		{
			pageNum=1;
		}
		//查找当前用户收到的普通消息
		Long userId=user.getId();
		Question question=new Question();
		question.setUserId(userId);
	    PageInfo<Question>pageInfo=questionService.page(1, 3, question, "createTime desc");
		//当前用户未处理的社团消息
		return JsonObject.toSuccessJson(pageInfo);
	}

}
