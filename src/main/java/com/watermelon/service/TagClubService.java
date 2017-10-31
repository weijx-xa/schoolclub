package com.watermelon.service;

import org.springframework.stereotype.Service;

import com.watermelon.pojo.Club;
import com.watermelon.pojo.Tag;
import com.watermelon.pojo.TagClub;
@Service
public class TagClubService  extends ManyToManyBaseService<TagClub,Tag,Club>{

}
