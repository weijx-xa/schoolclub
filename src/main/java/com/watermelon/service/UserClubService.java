package com.watermelon.service;

import org.springframework.stereotype.Service;

import com.watermelon.pojo.Club;
import com.watermelon.pojo.User;
import com.watermelon.pojo.UserClub;
@Service
public class UserClubService extends ManyToManyBaseService<UserClub, User, Club>{

}
