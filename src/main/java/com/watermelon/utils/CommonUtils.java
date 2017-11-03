package com.watermelon.utils;

import java.util.ArrayList;
import java.util.List;

import com.watermelon.pojo.Club;

public class CommonUtils {

	
	public static List<Club> setUnion(List<Club>a,List<Club> b){
		List<Club>clubList=new ArrayList<>();
		for(Club club:a)
		{
			clubList.add(club);
		}
		for(Club club:b)
		{
			clubList.add(club);
		}
		return clubList;
	}
}
