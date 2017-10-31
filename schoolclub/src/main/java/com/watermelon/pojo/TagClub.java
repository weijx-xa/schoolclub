package com.watermelon.pojo;
/**
 * 社团标签
 * @author watermelon
 *
 */
public class TagClub extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private Long tagId;
	private Long clubId;

	public Long getTagId() {
		return tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	public Long getClubId() {
		return clubId;
	}

	public void setClubId(Long clubId) {
		this.clubId = clubId;
	}

}
