package com.watermelon.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("activity")
public class ActivityController {

	@RequestMapping("list")
	public ModelAndView list()
	{
		ModelAndView modelAndView=new ModelAndView("activity");
		return modelAndView;
	}
	@RequestMapping("detail")
	public ModelAndView detail()
	{
		ModelAndView modelAndView=new ModelAndView("singleactivity");
		return modelAndView;
	}
}
