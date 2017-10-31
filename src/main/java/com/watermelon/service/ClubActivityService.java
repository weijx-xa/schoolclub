package com.watermelon.service;

import org.springframework.stereotype.Service;

import com.watermelon.pojo.Activity;
import com.watermelon.pojo.Club;
import com.watermelon.pojo.ClubActivity;
@Service
public class ClubActivityService extends ManyToManyBaseService<ClubActivity,Club,Activity>{

}
