package com.watermelon.service;

import org.springframework.stereotype.Service;

import com.watermelon.pojo.Club;
import com.watermelon.pojo.ClubType;

import aj.org.objectweb.asm.Type;
@Service
public class ClubTypeService extends ManyToManyBaseService<ClubType,Club,Type>{

}
