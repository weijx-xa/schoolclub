package com.watermelon.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("school")
public class SchoolController {
    @RequestMapping("news")
	public ModelAndView news(){
    	ModelAndView modelAndView=new ModelAndView("news");
    	return modelAndView;
    }
    
    @RequestMapping("detail")
	public ModelAndView detail(){
    	ModelAndView modelAndView=new ModelAndView("singlenews");
    	return modelAndView;
    }
}
