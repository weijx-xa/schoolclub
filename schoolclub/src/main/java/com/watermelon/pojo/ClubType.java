package com.watermelon.pojo;
/**
 * 社团类型
 * @author watermelon
 *
 */
public class ClubType extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
