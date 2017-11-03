package com.watermelon.utils;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtils {
	private static ObjectMapper objectMapper = new ObjectMapper();
    /**
     * 可以转换普通类型，如User、Card等，也可以转换带泛型的类，比如List<T>、Map<K,V>、Xxx<T>等
     * @param jsonStr   json字符串
     * @param beanClass
     * @param parametricTypes  泛型的具体类型
     * @return
     */
    @SuppressWarnings("all")
    public static <T> T toBean(String jsonStr, Class<T> beanClass, Class... parametricTypes) {
        try {
            if (parametricTypes == null || parametricTypes.length == 0) {
                return objectMapper.readValue(jsonStr, beanClass);
            } else {
                JavaType javaType = objectMapper.getTypeFactory().constructParametricType(beanClass, parametricTypes);
                return objectMapper.readValue(jsonStr, javaType);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
