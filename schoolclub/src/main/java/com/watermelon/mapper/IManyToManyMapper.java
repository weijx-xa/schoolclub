package com.watermelon.mapper;

import java.util.List;

public interface IManyToManyMapper<T, F, S> extends IMapper<T> {
	/**
	 * 根据第一张表的Id删除与之关联的数据
	 * 
	 * @param firstId
	 * @return
	 */
	int deleteByFirstId(Long firstId);

	/**
	 * 根据第二张表的Id删除与之关联的数据
	 * 
	 * @param secondId
	 * @return
	 */
	int deleteBySecondId(Long secondId);

	/**
	 * 根据第二张表的Id查找与之关联的第一张表的数据
	 * 
	 * @param secondId
	 * @return
	 */
	List<F> selectFirstListBySecondId(Long secondId);

	/**
	 * 根据第一张表的Id查找与之相关的第二张表的数据
	 * 
	 * @param firstId
	 * @return
	 */
	List<S> selectSecondListByFirstId(Long firstId);
}
