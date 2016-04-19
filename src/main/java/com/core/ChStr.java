package com.core;

public class ChStr {
    public static String toChinese(String strvalue) {
//        try {
//            if (strvalue == null) {
//                return "";
//            } else {
//                strvalue = new String(strvalue.getBytes("ISO8859_1"), "GBK").trim();
//                return strvalue;
//            }
//        } catch (Exception e) {
//            return "";
//        }
        return strvalue;
    }

    //处理字符串中的空值
    public static final String nullToString(String v, String toV) {
        if (v == null || "".equals(v)) {
            v = toV;
        }
        return v;
    }
}
