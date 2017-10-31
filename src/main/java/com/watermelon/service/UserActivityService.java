package com.watermelon.service;

import org.springframework.stereotype.Service;

import com.watermelon.pojo.Activity;
import com.watermelon.pojo.User;
import com.watermelon.pojo.UserActivity;
@Service
public class UserActivityService extends ManyToManyBaseService<UserActivity, User,Activity>{

}
