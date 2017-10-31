package com.watermelon.pojo;
/**
 * 社团标签
 * @author watermelon
 *
 */
public class Tag extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
