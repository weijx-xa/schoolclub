package com.watermelon.pojo;

/**
 * 社团活动
 * 
 * @author watermelon
 *
 */
public class ClubActivity extends BaseEntity{
	private static final long serialVersionUID = 1L;
	private Long clubId;
	private Long activityId;

	public Long getClubId() {
		return clubId;
	}

	public void setClubId(Long clubId) {
		this.clubId = clubId;
	}

	public Long getActivityId() {
		return activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

}
