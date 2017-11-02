package com.watermelon.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonObject {
	private String status;
	private Object value;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	/**
	 * 将对象转换成json字符串
	 * 
	 * @param obj
	 * @return
	 */
	public static String toJson(Object obj) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		return gson.toJson(obj);
	}
	
	public static String toSuccessJson(Object obj)
	{
		JsonObject jsonObject=new JsonObject();
		jsonObject.setStatus("true");
		jsonObject.setValue(obj);
		return JsonObject.toJson(jsonObject);
	}
	
	public static String toErrorJson(Object obj)
	{
		JsonObject jsonObject=new JsonObject();
		jsonObject.setStatus("false");
		jsonObject.setValue(obj);
		return JsonObject.toJson(jsonObject);
	}

}
