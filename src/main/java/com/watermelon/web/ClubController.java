package com.watermelon.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.watermelon.pojo.Club;
import com.watermelon.service.ClubService;
import com.watermelon.utils.JsonObject;

@Controller
@RequestMapping("club")
public class ClubController {
  
	@Autowired
	private ClubService clubService;
	
	@RequestMapping("list")
	public ModelAndView list()
	{
		ModelAndView modelAndView=new ModelAndView("club");
		return modelAndView;
	}
	
	@RequestMapping(value="getData",method=RequestMethod.POST)
	public @ResponseBody String getData(Integer pageNum)
	{
		if(pageNum==null||pageNum<1)
		{
			pageNum=1;
		}
		
		Club club=new Club();
		club.setIsDeleted(false);
		PageInfo<Club> pageInfo=clubService.page(pageNum, 8, club, null);
		JsonObject jsonObject=new JsonObject();
		jsonObject.setStatus("true");
		jsonObject.setValue(pageInfo);
		return JsonObject.toJson(jsonObject);
	}
	
	
	
	@RequestMapping("detail")
	public ModelAndView detail()
	{
		ModelAndView modelAndView=new ModelAndView("singleclub");
		return modelAndView;
	}
	
	@RequestMapping("create1")
	public ModelAndView create1()
	{
		ModelAndView modelAndView=new ModelAndView("createclub1");
		return modelAndView;
	}
	
	@RequestMapping("create2")
	public ModelAndView create2()
	{
		ModelAndView modelAndView=new ModelAndView("createclub2");
		return modelAndView;
	}
}
