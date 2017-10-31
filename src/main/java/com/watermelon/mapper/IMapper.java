package com.watermelon.mapper;

import java.util.List;

public interface IMapper<T> {
	/**
	 * 插入数据
	 * 
	 * @param pojo
	 * @return
	 */
	public int insert(T pojo);

	/**
	 * 根据Id删除数据
	 * 
	 * @param id
	 * @return
	 */
	public int delete(T pojo);

	/**
	 * 更新数据
	 * 
	 * @param pojo
	 * @return
	 */
	public int update(T pojo);

	/**
	 * 查询数据
	 * 
	 * @param pojo
	 * @return
	 */
	public List<T> select(T pojo);
}
