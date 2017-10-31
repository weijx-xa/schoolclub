package com.watermelon.pojo;

public class School extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private String name;
	private String college;
	private String professional;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getProfessional() {
		return professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}
}
