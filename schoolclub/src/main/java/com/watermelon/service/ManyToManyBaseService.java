package com.watermelon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.watermelon.mapper.IManyToManyMapper;

public class ManyToManyBaseService<T,F,S> extends BaseService<T>{
  

	private IManyToManyMapper<T, F, S>mapper;
	/**
	 * 根据第一张表的Id，删除与之相关的第二张表的数据
	 * @param firstId
	 * @return
	 */
	public int deleteByFirstId(Long firstId)
	{
		if(firstId==null)
		{
			throw new RuntimeException("firstId不能为null");
		}
		return mapper.deleteByFirstId(firstId);
	}
	/**
	 * 根据第二张表的Id，删除与之相关的第一张表的数据
	 * @param secondId
	 * @return
	 */
	public int deleteBySecondId(Long secondId)
	{
		if(secondId==null)
		{
			throw new RuntimeException("secondId不能为null");
		}
		return mapper.deleteBySecondId(secondId);
	}
	/**
	 * 根据第二张表id，查询与之相关的第一张表的数据
	 * @param secondId
	 * @return
	 */
	public List<F>selectFirstListBySecondId(Long secondId)
	{
		if(secondId==null)
		{
			throw new RuntimeException("secondId不能为null");
		}
		return mapper.selectFirstListBySecondId(secondId);
	}
	/**
	 * 根据第二张表的Id查找与之相关的第一张表的数据的第一条。
	 * @param secondId
	 * @return
	 */
	public F selectFirstOneBySecondId(Long secondId)
	{
		if(secondId==null)
		{
			throw new RuntimeException("secondId不能为null");
		}
		PageHelper.startPage(1,1);
		List<F>list=selectFirstListBySecondId(secondId);
	    if(list!=null&&list.size()>0)
	    {
	    	return list.get(0);
	    }
	    return null;
	}
	
	
	
	/**
	 * 根据第二张表id，查询与之相关的第一张表的数据
	 * @param firstId
	 * @return
	 */
	public List<S>selectSecondListByFirstId(Long firstId)
	{
		if(firstId==null)
		{
			throw new RuntimeException("firstId不能为null");
		}
		return mapper.selectSecondListByFirstId(firstId);
	}
	/**
	 * 根据第二张表的Id查找与之相关的第一张表的数据的第一条。
	 * @param FirstId
	 * @return
	 */
	public S selectSecondOneByFirstId(Long firstId)
	{
		if(firstId==null)
		{
			throw new RuntimeException("firstId不能为null");
		}
		PageHelper.startPage(1,1);
		List<S>list=selectSecondListByFirstId(firstId);
	    if(list!=null&&list.size()>0)
	    {
	    	return list.get(0);
	    }
	    return null;
	}
}
