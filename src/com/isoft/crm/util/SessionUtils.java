package com.isoft.crm.util;

import javax.servlet.http.HttpSession;

import com.isoft.crm.bean.UserSession;

/**
 * 
 *@Title: SessionUtils.java
 *@Package: com.isoft.util
 *@Description:
 *		Setting and Getting the user info of session.
 *		Verify the validate code.
 *		Clear the session.
 *@author: Nina Zhao
 *@date:下午10:53:14
 */

public class SessionUtils {
	//Verification Code in the session. The initial one is in the below.
	public static String RANDOMCODEKEY= "ASDFADSFASDFGQWERASDF";
	
	//User
	public static final String User = "userSession";
	
	//Connect the user info to the session.
	public static void saveUserSession(HttpSession session, UserSession userSession) {
		session.setAttribute(User, userSession);
	}
	
	//Getting info from session
	public static UserSession getUserFormSession(HttpSession session) {
		Object attribute  = session.getAttribute(User);
		//it will return null when attribute is null.
		//Otherwise it will cast the attribute to UserSession
		return attribute == null?null:(UserSession)attribute;
	}
	
	//Quit
	public static void logout(HttpSession session) {
		session.removeAttribute(User);
	}
	
	//Verify the Verification Code
	public static boolean checkValidateCode(String inputCode, HttpSession session) {
		String code = (String)session.getAttribute(SessionUtils.RANDOMCODEKEY);
		//Only success when the input code perfect equal to verification code. NOT NULL OR "".
//		System.out.println("code:"+code);
//		System.out.println(inputCode!=null);
//		System.out.println(!inputCode.equals(""));
//		System.out.println(inputCode.equalsIgnoreCase(code));
		if(inputCode!=null&&!inputCode.equals("")&&inputCode.equalsIgnoreCase(code)) {
			return true;
		}
		return false;
	}
}
