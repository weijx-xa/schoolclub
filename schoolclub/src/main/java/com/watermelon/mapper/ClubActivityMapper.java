package com.watermelon.mapper;
import com.watermelon.pojo.Activity;
import com.watermelon.pojo.Club;
import com.watermelon.pojo.ClubActivity;
public interface ClubActivityMapper extends IManyToManyMapper<ClubActivity, Club, Activity> {

}
