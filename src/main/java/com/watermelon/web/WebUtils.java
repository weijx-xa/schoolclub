package com.watermelon.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.watermelon.pojo.User;

@Controller
public class WebUtils {

	public Object getSession(String name) {
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes();
		HttpServletRequest request = requestAttributes.getRequest();
		return request.getSession().getAttribute(name);
	}

	public void setSession(User user) {
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes();
		HttpServletRequest request = requestAttributes.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
	}

	/**
	 * 判断用户是否登录
	 * 
	 * @return
	 */
	public boolean isLogin() {
		User user = (User) getSession("user");
		if (user != null) {
			return true;
		} else {
			return false;
		}
	}
}
