package com.watermelon.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.watermelon.pojo.User;

public class HttpUtils {
	private static Logger logger = LogManager.getLogger(HttpUtils.class);
	public static String SESSION_KEY_EMAIL_CODE = "SESSION_KEY_EMAIL_CODE";
	public static String SESSION_KEY_EMAIL_TO = "SESSION_KEY_EMAIL_TO";
	public static String SESSION_KEY_EMAIL_TIME = "SESSION_KEY_EMAIL_TIME";
	public static String SESSION_KEY_EMAIL_REMAIN_CHECK_COUNT = "SESSION_KEY_EMAIL_REMAIN_CHECK_COUNT";
	public static String api_user = "watermelon_com_test_cfVhEK";
	public static String api_key = "vN4P4032ly5x7Nc0";
	public static String templateInvokeName = "template_email_code";
	public static String from = "000000000@qq.com";

	public static String post(String url, Map<String, String> params) throws IOException {
		CloseableHttpClient httpClient = null;
		CloseableHttpResponse httpResponse = null;
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		if (params != null) {
			Set<Entry<String, String>> entrySet = params.entrySet();
			for (Entry<String, String> entry : entrySet) {
				paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
			}
		}
		try {
			httpClient = HttpClients.createDefault();
			HttpPost httpPost = new HttpPost(url);
			httpPost.setEntity(new UrlEncodedFormEntity(paramList));
			httpResponse = httpClient.execute(httpPost);
			String result = EntityUtils.toString(httpResponse.getEntity());
			logger.debug("发送http post请求，url：{}，请求参数：{}，响应结果：{}", url, params, result);
			return result;
		} finally {
			closeQuietly(httpResponse);
			closeQuietly(httpClient);
		}
	}
	
	public static void sendEmailCode(HttpSession session,String to){
		String emailCode = new Random().nextInt(90000) + 10000 + "";// 准备一个五位数的验证码
		session.setAttribute(SESSION_KEY_EMAIL_CODE, emailCode);
		logger.debug("发送邮件验证码成功，email：{}，code：{}", to, emailCode);
	}

	/**
	 * 
	 * 发送sendcloud邮件验证码
	 * 
	 * @param session
	 * @param smtpServer
	 * @param username
	 * @param password
	 * @param from
	 * @param to
	 * 
	 */

	

	
	
	public static void sendEmailCodeBySendCloud(HttpSession session, String url, String apiUser, String apiKey,
			String from, String to, String templateInvokeName) {
		String emailCode = new Random().nextInt(90000) + 10000 + "";// 准备一个五位数的验证码
		// 准备请求参数,放到params里面去,此处要记住{xx,xx,...}的字符串用map的形式存储,["xx","xx"]用数组形式存储
		// 然后再转换成json字符串,就是{**:**,**:[xx,xx]}的形式了
		Map<String, String> params = new HashMap<>();
		params.put("apiUser", apiUser);
		params.put("apiKey", apiKey);
		params.put("from", from);
		Map<String, Object> xsmtpapi = new HashMap<>();
		xsmtpapi.put("to", new String[] { to });
		Map<String, Object> sub = new HashMap<>();
		sub.put("%code%", new String[] { emailCode });
		xsmtpapi.put("sub", sub);
		params.put("xsmtpapi", JsonObject.toJson(xsmtpapi));
		params.put("templateInvokeName", templateInvokeName);
		try {
			String result = HttpUtils.post(url, params);// 以post请求发送邮件,发送个map对象即可
			Pattern pattern = Pattern.compile("\"result\"*:*true");
			if (!pattern.matcher(result).find()) {
				throw new RuntimeException("发送邮件失败,相应信息为:" + result);
			}
			session.setAttribute(SESSION_KEY_EMAIL_CODE, emailCode);
			session.setAttribute(SESSION_KEY_EMAIL_TO, to);
			session.setAttribute(SESSION_KEY_EMAIL_TIME, System.currentTimeMillis());
			session.setAttribute(SESSION_KEY_EMAIL_REMAIN_CHECK_COUNT, 5);// 一个邮件验证码默认可验证5次，5此后就需要重新发送验证码
			logger.debug("发送邮件验证码成功，email：{}，code：{}", to, emailCode);

		} catch (Exception e) {

			logger.debug("发送邮件验证码失败，email：{}，code：{}", to, emailCode, e);

			throw new RuntimeException("发送邮箱验证码失败", e);

		}

	}

	public static boolean checkEmailCode(HttpSession session, String code,String from) {
		String emailCode = (String) session.getAttribute(HttpUtils.SESSION_KEY_EMAIL_CODE);
		String email=(String) session.getAttribute("tempUser");
		if (code.equals(emailCode)&&from.equals(email)) {
			return true;
		}
		return false;
	}

	private static void closeQuietly(CloseableHttpClient httpClient) {
		if (httpClient != null) {
			try {
				httpClient.close();
			} catch (Exception e) {
			}
		}
	}

	private static void closeQuietly(CloseableHttpResponse httpResponse) {
		if (httpResponse != null) {
			try {
				httpResponse.close();
			} catch (Exception e) {
			}
		}
	}
}
