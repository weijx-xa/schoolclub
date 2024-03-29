package com.watermelon.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.watermelon.pojo.Activity;
import com.watermelon.pojo.Answer;
import com.watermelon.pojo.Club;
import com.watermelon.pojo.Question;
import com.watermelon.pojo.User;
import com.watermelon.pojo.UserClub;
import com.watermelon.service.AnswerService;
import com.watermelon.service.ClubActivityService;
import com.watermelon.service.ClubService;
import com.watermelon.service.QuestionService;
import com.watermelon.service.UserClubService;
import com.watermelon.utils.JedisUtils;
import com.watermelon.utils.JsonObject;

@Controller
@RequestMapping("club")
public class ClubController {
  
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private ClubActivityService clubActivityService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private WebUtils webUtils;
	
	@Autowired
	private UserClubService userClubService;
	
	@RequestMapping("list")
	public ModelAndView list()
	{
		ModelAndView modelAndView=new ModelAndView("club");
		return modelAndView;
	}
	/**
	 * 社团分页数据
	 * @param pageNum
	 * @return
	 */
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
	

	
	/**
	 * 某个社团详情页面
	 * @param clubId
	 * @return
	 */
	@RequestMapping("detail")
	public ModelAndView detail(Long clubId,Integer pageNum)
	{
		if(clubId==null)
		{
			clubId=(long) 1;
		}
		Club club=new Club();
		club.setId(clubId);
		club=clubService.selectOne(club);
		PageHelper.startPage(1,3);
		List<Activity>list=clubActivityService.selectSecondListByFirstId(clubId);
		if(pageNum==null||pageNum<1)
		{
			pageNum=1;
		}
		Question question=new Question();
		question.setIsDeleted(false);
		question.setClubId(clubId);
		PageInfo<Question>pageInfo=questionService.page(1, 3*pageNum, question, "createTime desc");
		pageInfo=addAnswerList(pageInfo);//加入回复
		ModelAndView modelAndView=new ModelAndView("singleclub");
		modelAndView.addObject("club",club);
		modelAndView.addObject("list",list);
		modelAndView.addObject("pageNum", pageNum);
		modelAndView.addObject("pageInfo",pageInfo);
		return modelAndView;
	}
	
	
	private  PageInfo<Question> addAnswerList(PageInfo<Question>pageInfo){
		List<Question>questionList=pageInfo.getList();
		for(Question question:questionList)
		{
			Long questionId=question.getId();
			Answer answer=new Answer();
			answer.setQuestionId(questionId);
			answer.setIsDeleted(false);
			List<Answer>answerList=answerService.page(1, 3,answer, "createTime desc").getList();
			question.setAnswerList(answerList);
		}
		return pageInfo;
	}
	
	
//	@RequestMapping(value="nextPage",method=RequestMethod.POST)
//	public @ResponseBody String nextPage(Long clubId,Integer pageNum)
//	{
//		if(pageNum==null||pageNum<1)
//		{
//			pageNum=1;
//		}
//		Question question=new Question();
//		question.setIsDeleted(false);
//		question.setClubId(clubId);
//		PageInfo<Question>pageInfo=questionService.page(1, 3*pageNum, question, "createTime desc");
//	}
//	
	/**
	 * 评论社团
	 * @param content
	 * @param clubId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="askClubFormClub",method=RequestMethod.POST)
	public @ResponseBody String askClubFormClub(String content,Long clubId,Long questionId,HttpServletRequest request)
	{
		User user=(User) webUtils.getSession("user");
		if(user==null)
		{
			return JsonObject.toErrorJson("请先登录");
		}
		Long userId=user.getId();
		if(questionId!=null)
		{
			Question quesiton=new Question();
			quesiton.setId(questionId);
			clubId=questionService.selectOne(quesiton).getClubId();
		}
		
		if(clubId==null||StringUtils.isEmpty(content))
		{
			return JsonObject.toErrorJson("数据不能为null");
		}
		Club club=new Club();
		club.setId(clubId);
		if(!clubService.isExisted(club))
		{
			return JsonObject.toErrorJson("评论的社团不存在");
		}
		Question question=new Question();
		question.setContent(content);
		question.setClubId(clubId);
		question.setUserId(userId);
		question.setCreateTime(new Date());
		question.setIsDeleted(false);
		questionService.insert(question);
		
		
		//将消息存入redis服务器中
		//数据结构   key:notification_{要通知的用户Id}   value:jsonObject
		
		
		Map<String, Object>notification=new HashMap<>();
		Question param=new Question();
		param.setUserId(userId);
		param=questionService.selectList(param, "createTime desc").get(0);
		String username=null;
		if(user.getNickName()==null||user.getNickName()=="")
		{
			username=user.getEmail();
		}
		else{
			username=user.getNickName();
		}
		notification.put("byName", username);
		notification.put("byId", user.getId());
		notification.put("questionId",param.getId());
		notification.put("content",param.getContent());
		
		//找出所有要通知的对象
		UserClub userClub=new UserClub();
		userClub.setClubId(param.getClubId());
		userClub.setStatus("管理员");
		userClub=userClubService.selectOne(userClub);
		
		if(userClub!=null&&user.getId()!=userClub.getUserId())
		{
			//如果发表评论的不是管理员自己,将消息放到消息队列
			JedisUtils.sadd("notification_"+userClub.getUserId(), JsonObject.toJson(notification));
		}
		return JsonObject.toSuccessJson("评论成功");
		
	}
	
	
	/**
	 * 评论用户
	 * @param content
	 * @param questionId
	 * @param request
	 * @return
	 */
	@RequestMapping(value="askUserSubmit",method=RequestMethod.POST)
	public @ResponseBody String askUserSubmit(String content,Long answerId,Long questionId,HttpServletRequest request){
		
		User user=(User) webUtils.getSession("user");
		if(user==null)
		{
			return JsonObject.toErrorJson("请先登录");
		}
		Long userId=user.getId();
		if("".equals(content))
		{
			return JsonObject.toErrorJson("数据不能为null");
		}
		
		Answer answer=new Answer();
		answer.setContent(content);
		answer.setCreateTime(new Date());
		answer.setIsDeleted(false);
		answer.setQuestionId(questionId);
		answer.setParentId(answerId);
		answer.setUserId(userId);
		answerService.insert(answer);
		
		Map<String, Object> notification=new HashMap<>();
		//刚刚插入的消息
		Answer param=new Answer();
		param.setUserId(userId);
		param=answerService.selectList(param, "createTime desc").get(0);
		
		
		String username=null;
		if(user.getNickName()==null)
		{
			username=user.getEmail();
		}
		else{
			username=user.getNickName();
		}
		notification.put("byName", username);
		notification.put("byId", user.getId());
		notification.put("answerId",param.getId());
		notification.put("content",param.getContent());
		Question question=new Question();
		question.setId(param.getQuestionId());
		question=questionService.selectOne(question);
		if(userId!=question.getUserId()&&questionId!=null)
		{
			JedisUtils.sadd("notification_"+question.getUserId(), JsonObject.toJson(notification));
		}
		if(answerId!=null)
		{
			Answer a=new Answer();
			a.setId(answerId);
			a=answerService.selectList(a).get(0);
			JedisUtils.sadd("notification_"+a.getUserId(), JsonObject.toJson(notification));
		}
		return JsonObject.toSuccessJson("回复成功");
		
	}
	
	@RequestMapping(value="joinClub",method=RequestMethod.POST)
	public @ResponseBody String joinClub(Long clubId){
		User user=(User) webUtils.getSession("user");
		if(user==null)
		{
			return JsonObject.toErrorJson("请先登录");
		}
		if(clubId==null)
		{
			return JsonObject.toErrorJson("clubId不能为null");
		}
		UserClub a=new UserClub();
		a.setClubId(clubId);
		a.setIsDeleted(false);
		a.setStatus("申请");
		a.setUserId(user.getId());
		a=userClubService.selectOne(a);
		if(a!=null)
		{
		   return JsonObject.toErrorJson("您已经申请过该社团了，不能重复申请");
		}
		
		
		UserClub userClub=new UserClub();
		userClub.setClubId(clubId);
		userClub.setCreateTime(new Date());
		userClub.setIsDeleted(false);
		userClub.setStatus("申请");
		userClub.setUserId(user.getId());
		userClubService.insert(userClub);
		Club club=new Club();
		club.setId(clubId);
		club=clubService.selectOne(club);
		Map<String, Object> notification=new HashMap<>();
		
		String username=null;
		if(user.getNickName()==null)
		{
			username=user.getEmail();
		}
		else{
			username=user.getNickName();
		}
		notification.put("byName", username);
		notification.put("byId", user.getId());
		notification.put("userClubId",userClub.getId());
		notification.put("content","<a  href='/schoolclub/user/clubMessage'>申请加入"+club.getName()+"，请及时处理</a>");
		//通知对象
		UserClub param=new UserClub();
		param.setClubId(clubId);
		param.setIsDeleted(false);
		param.setStatus("管理员");
		param=userClubService.selectOne(param);
		if(user.getId()!=param.getUserId())
		{
			//通知管理员
			JedisUtils.sadd("notification_"+param.getUserId(), JsonObject.toJson(notification));
		}
		
		return JsonObject.toSuccessJson("申请成功，将在24小时内将告知审批结果");
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
