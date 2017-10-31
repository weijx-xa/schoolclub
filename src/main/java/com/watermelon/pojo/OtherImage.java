package com.watermelon.pojo;

public class OtherImage extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private Long activityId;
	private String other;

	public Long getActivityId() {
		return activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

}
