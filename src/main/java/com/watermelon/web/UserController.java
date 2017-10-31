package com.watermelon.web;

import java.util.List;

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
		ModelAndView modelAndView = new ModelAndView("index");
		return modelAndView;
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView Login(String account, String password) {
		if (StringUtils.isAnyEmpty(account, password)) {
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "所填数据不能为null");
			return modelAndView;
		}
		User user = new User();
		if (RegexpUtils.isHardRegexpValidate(account, RegexpUtils.EMAIL_REGEXP)) {
			user.setEamil(account);
		} else if (RegexpUtils.isHardRegexpValidate(account, RegexpUtils.PHONE_REGEXP)) {
			user.setPhoneNum(account);
		} else {
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "账号不符合规范");
			return modelAndView;
		}
		String salt = user.getSalt();
		user.setPassword(DigestUtils.md5Hex(password + salt));
		List<User> userList = userService.selectList(user);
		if (!CollectionUtils.isEmpty(userList) && userList.size() > 0) {
			webUtils.setSession(userList.get(0));
			ModelAndView modelAndView = new ModelAndView("redirect:/");
			return modelAndView;
		}
		else{
			ModelAndView modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "账号或者密码错误");
			return modelAndView;
		}
	}
	@RequestMapping("register")
	public ModelAndView register()
	{
		ModelAndView modelAndView = new ModelAndView("register");
		return modelAndView;
	}
	
	@RequestMapping(value="register",method=RequestMethod.POST)
	public ModelAndView register(User user)
	{
		ModelAndView modelAndView = new ModelAndView("registerSuccess");
		return modelAndView;
	}
}
