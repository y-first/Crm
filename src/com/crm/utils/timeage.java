package com.crm.utils;

import java.util.HashMap;
import java.util.Map;

public class timeage {
	/**
	 * 通过身份证号码获取出生日期.年龄
	 * 
	 * @param certificateNo
	 * @return 返回的出生日期格式：1990-01-01 性别格式：F-女，M-男
	 */
	public static Map<String, String> getBirAgeSex(String certificateNo) {
		String birthday = "";
		String sexCode = "";

		char[] number = certificateNo.toCharArray();
		boolean flag = true;
		if (number.length == 15) {
			for (int x = 0; x < number.length; x++) {
				if (!flag)
					return new HashMap<String, String>();
				flag = Character.isDigit(number[x]);
			}
		} else if (number.length == 18) {
			for (int x = 0; x < number.length - 1; x++) {
				if (!flag)
					return new HashMap<String, String>();
				flag = Character.isDigit(number[x]);
			}
		}
		if (flag && certificateNo.length() == 15) {
			birthday = "19" + certificateNo.substring(6, 8) + "-" + certificateNo.substring(8, 10) + "-"
					+ certificateNo.substring(10, 12);
			sexCode = Integer.parseInt(certificateNo.substring(certificateNo.length() - 3, certificateNo.length()))
					% 2 == 0 ? "F" : "M";
		} else if (flag && certificateNo.length() == 18) {
			birthday = certificateNo.substring(6, 10) + "-" + certificateNo.substring(10, 12) + "-"
					+ certificateNo.substring(12, 14);
			sexCode = Integer.parseInt(certificateNo.substring(certificateNo.length() - 4, certificateNo.length() - 1))
					% 2 == 0 ? "F" : "M";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("birthday", birthday);
		map.put("sexCode", sexCode);
		return map;
	}
}
