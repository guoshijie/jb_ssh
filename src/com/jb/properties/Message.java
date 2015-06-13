package com.jb.properties;

import java.io.IOException;
import java.util.Properties;

public class Message {

	private static Properties prop = new Properties();
	
	static{
		try {
			prop.load(Message.class.getResourceAsStream("Message.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static final String ADMIN_LOGIN_ERROR = prop.getProperty("ADMIN_LOGIN_ERROR");
	public static final String USER_UPDATE_SUCCESS = prop.getProperty("USER_UPDATE_SUCCESS");
	public static final String ADDRESS_DEL_ERROR = prop.getProperty("ADDRESS_DEL_ERROR");
	
}
