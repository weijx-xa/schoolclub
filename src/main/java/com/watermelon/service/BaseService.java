package com.watermelon.service;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.watermelon.imapper.IMapper;

public class BaseService<T> {
	
	@Autowired
	private IMapper<T> mapper;

	/**
	 * 插入数据
	 * 
	 * @param pojo
	 * @return
	 */
	public int insert(T pojo) {
		if (pojo == null) {
			throw new RuntimeException("插入的实体类不能为null");
		}
		return mapper.insert(pojo);
	}

	/**
	 * 删除数据
	 * 
	 * @param pojo
	 * @return
	 */
	public int delete(T pojo) {
		if (pojo == null) {
			throw new RuntimeException("删除的实体类不能为null");
		}
		return mapper.delete(pojo);
	}

	/**
	 * 根据Id删除数据
	 * 
	 * @param id
	 * @return
	 */
	public int delete(Long id) {
		if (id == null) {
			throw new RuntimeException("删除的Id不能为null");
		}
		T pojo = createInstanceAndSetId(id);
		return mapper.delete(pojo);
	}

	/**
	 * 更新数据
	 * 
	 * @param pojo
	 * @return
	 */
	public int update(T pojo) {
		if (pojo == null) {
			throw new RuntimeException("更新的实体类不能为null");
		}
		return mapper.update(pojo);

	}

	/**
	 * 查询某条数据
	 * 
	 * @param pojo
	 * @return
	 */
	public List<T> selectList(T pojo) {
		return mapper.select(pojo);
	}

	
	
	public T selectOne(T pojo) {
		List<T> list= mapper.select(pojo);
		if(list==null||list.size()<1)
		{
			return null;
		}
		return list.get(0);
	}

	/**
	 * 根据Id查询某条数据
	 * 
	 * @param id
	 * @return
	 */
	public T selectOnetById(Long id) {
		if (id == null) {
			throw new RuntimeException("删除的Id不能为null");
		}
		T pojo = createInstanceAndSetId(id);
		List<T>list= selectList(pojo);
		if(list==null||list.size()==0)
		{
			return null;
		}
		return list.get(0);
	}

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	public List<T> selectAll() {
		return selectList(null);
	}

	/**
	 * 查询数据，并且排序 orderBy=“name desc”
	 * 
	 * @param pojo
	 * @param orderBy
	 * @return
	 */
	public List<T> selectList(T pojo, String orderBy) {
		if (orderBy == null || "".equals(orderBy)) {
			throw new RuntimeException("orderBy不能为null");
		}
		PageHelper.orderBy(orderBy);
		return selectList(pojo);
	}
	/**
	 * 分页查询
	 * @param pageNum 当前页
	 * @param pageSize  页容量
	 * @param pojo  查询条件
	 * @param orderBy 排序
	 * @return
	 */
	public PageInfo<T> page(int pageNum,int pageSize,T pojo,String orderBy)
	{
		PageHelper.startPage(pageNum, pageSize);
		PageHelper.orderBy(orderBy);
		List<T>list=mapper.select(pojo);
		return new PageInfo<T>(list);
	}
	/**
	 * 查看数据库里是否存在与pojo相同的数据
	 * @param pojo
	 * @return
	 */
	public Boolean isExisted(T pojo)
	{
		PageHelper.startPage(1, 1);
		List<T> list=selectList(pojo);
		if(list!=null&&list.size()>0)
		{
			return true;
		}
		return false;
	}
	
	

	/**
	 * 获取当前对象对应的pojo类对象，并且把id放进对象里面去
	 * 
	 * @param id
	 * @return
	 */
	@SuppressWarnings("all")
	private T createInstanceAndSetId(Long id) {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		Class tClass = (Class) type.getActualTypeArguments()[0];

		T t = null;
		try {
			t = (T) tClass.newInstance();
			tClass.getDeclaredMethod("setId", Long.class).invoke(t, id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return t;
	}
}
