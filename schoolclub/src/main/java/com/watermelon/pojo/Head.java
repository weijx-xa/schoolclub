package com.watermelon.pojo;
/**
 * 头条(咨询)
 * @author watermelon
 *
 */
public class Head extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private String title;
	private String content;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
