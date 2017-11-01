package com.watermelon.web;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.watermelon.pojo.User;
import com.watermelon.service.UserService;
import com.watermelon.utils.HttpUtils;
import com.watermelon.utils.RegexpUtils;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private WebUtils webUtils;

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
		webUtils.setSession(user);
		ModelAndView modelAndView = new ModelAndView("personInfo");
		return modelAndView;
	}
	@RequestMapping("info")
	public ModelAndView personInfo()
	{
		ModelAndView modelAndView = new ModelAndView("personInfo");
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
	public ModelAndView message(User user) {
		ModelAndView modelAndView = new ModelAndView("message");
		return modelAndView;
	}

}
