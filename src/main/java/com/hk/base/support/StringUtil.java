package com.hk.base.support;

public class StringUtil {
	public static Float toFloat(String str){
		if(str != null && str.length()>0){
			System.out.println("str:"+str);
			return Float.valueOf(str);
		}else{
			return 0f;
		}
	}
	public static boolean isEmpty(String str) {
		if (str == null) {
			return true;
		} else {
			return str.length() == 0;
		}
	}
}
