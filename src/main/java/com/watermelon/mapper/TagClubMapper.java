package com.watermelon.mapper;

import com.watermelon.pojo.Club;
import com.watermelon.pojo.Tag;
import com.watermelon.pojo.TagClub;

public interface TagClubMapper extends IManyToManyMapper<TagClub,Tag, Club>{

}
