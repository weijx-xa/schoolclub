package com.watermelon.mapper;

import java.util.List;

import com.watermelon.imapper.IManyToManyMapper;
import com.watermelon.pojo.Club;
import com.watermelon.pojo.User;
import com.watermelon.pojo.UserClub;

public interface UserClubMapper extends IManyToManyMapper<UserClub,User, Club>{

	List<Club> selectSecondListByFirst(UserClub userClub);
   
}
