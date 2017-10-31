package com.watermelon.mapper;

import com.watermelon.pojo.Activity;
import com.watermelon.pojo.User;
import com.watermelon.pojo.UserActivity;

public interface UserActivityMapper extends IManyToManyMapper<UserActivity,User, Activity>{

}
