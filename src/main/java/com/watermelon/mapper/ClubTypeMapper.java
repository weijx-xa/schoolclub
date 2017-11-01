package com.watermelon.mapper;

import com.watermelon.imapper.IManyToManyMapper;
import com.watermelon.pojo.Club;
import com.watermelon.pojo.ClubType;

import aj.org.objectweb.asm.Type;

public interface ClubTypeMapper extends IManyToManyMapper<ClubType,Club,Type>{

}
