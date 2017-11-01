package com.watermelon.mapper;

import com.watermelon.imapper.IManyToManyMapper;
import com.watermelon.pojo.Club;
import com.watermelon.pojo.User;
import com.watermelon.pojo.UserClub;

public interface UserClubMapper extends IManyToManyMapper<UserClub,User, Club>{
   
}
