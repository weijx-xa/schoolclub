package com.watermelon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.watermelon.mapper.UserClubMapper;
import com.watermelon.pojo.Club;
import com.watermelon.pojo.User;
import com.watermelon.pojo.UserClub;

@Service
public class UserClubService extends ManyToManyBaseService<UserClub, User, Club> {
	
	@Autowired
	private UserClubMapper userClubMapper;
	
	public List<Club>selectSecondListByFirst(UserClub userClub)
	{
	
		return userClubMapper.selectSecondListByFirst(userClub);
	}
}
