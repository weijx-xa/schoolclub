package com.watermelon.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.watermelon.pojo.User;
import com.watermelon.utils.HttpUtils;
import com.watermelon.utils.JsonObject;
import com.watermelon.utils.RegexpUtils;

@Controller
public class IndexController {
	@Autowired
	private WebUtils webUtils;

	@RequestMapping("/")
	public ModelAndView root(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView("redirect:/index");
		return modelAndView;
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		User user = (User) webUtils.getSession("user");
		ModelAndView modelAndView = new ModelAndView("index");
		if (user != null) {
			modelAndView.addObject("user", user);
		}
		return modelAndView;
	}

	@RequestMapping(value = "sendEmail", method = RequestMethod.POST)
	public @ResponseBody String sendEmail(HttpServletRequest request, String to)
	{
		if(StringUtils.isAnyEmpty(to)||!RegexpUtils.isHardRegexpValidate(to, RegexpUtils.EMAIL_REGEXP))
		{
			JsonObject obj = new JsonObject();
			obj.setStatus("false");
			obj.setValue("邮箱格式不正确，请重新填写");
			return JsonObject.toJson(obj);
		}
		HttpUtils.sendEmailCode(request.getSession(), "844704781@qq.com");
		User user = new User();
		user.setEmail(to);
		request.getSession().setAttribute("tempUser",to);
		JsonObject obj = new JsonObject();
		obj.setStatus("true");
		obj.setValue("邮件已发送给" + to + ",请及时查收");
		return JsonObject.toJson(obj);
	}
}
