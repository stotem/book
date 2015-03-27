<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" import="com.actionForm.ReaderTypeForm" errorPage="/error.jsp" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<%
    Collection coll = (Collection) request.getAttribute("readerType");
%>
<head>
    <title>图书馆管理系统</title>
    <link href="CSS/style.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body onLoad="clockon(bgclock)">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
    <tr>
        <td height="183">
            <%@include file="navigation.jsp" %>
        </td>
    </tr>
    <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" bgcolor="#FFFFFF">
                    <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0"
                           bgcolor="#FFFFFF" class="tableBorder_gray">
                        <tr>
                            <td height="510" valign="top" style="padding:5px;">
                                <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" valign="top" class="word_orange">当前位置：读者管理 &gt; 读者类型管理 &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                        %>
                                            <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">暂无读者类型信息！</td>
                                                </tr>
                                            </table>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="35">
                                                        <a href="#"
                                                           onClick="window.open('readerType_add.jsp','','width=292,height=175')">添加读者类型信息</a>
                                                    </td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {
                                                //通过迭代方式显示数据
                                                Iterator it = coll.iterator();
                                                int ID = 0;
                                                String name = "";
                                                int number = 0;
                                            %>
                                            <table width="91%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="right" height="35">
                                                        <a href="#"
                                                           onClick="window.open('readerType_add.jsp','','width=292,height=175')">添加读者类型信息</a>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="91%" border="1" cellpadding="0" cellspacing="0"
                                                   bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
                                                   bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td height="35" width="35%">读者类型名称</td>
                                                    <td width="35%">可借数量</td>
                                                    <td width="20%" colspan="2">操作</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        ReaderTypeForm readerTypeForm = (ReaderTypeForm) it.next();
                                                        ID = readerTypeForm.getId().intValue();
                                                        name = chStr.toChinese(readerTypeForm.getName());
                                                        number = readerTypeForm.getNumber();
                                                %>
                                                <tr>
                                                    <td style="padding:5px;">&nbsp;<%=name%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=number%>
                                                    </td>
                                                    <td align="center"><a href="#"
                                                                          onClick="window.open('readerType.do?action=readerTypeModifyQuery&ID=<%=ID%>','','width=292,height=175')">修改</a>
                                                    </td>
                                                    <td align="center"><a
                                                            href="readerType.do?action=readerTypeDel&ID=<%=ID%>" onclick="return window.confirm('温馨提示:您正在执行数据删除操作，确定继续？')">删除</a>
                                                    </td>
                                                </tr>
                                                <%
                                                        }
                                                %>
                                                <tr align="right" bgcolor="#e3F4F7">
                                                    <td colspan="4" height="35" style="padding-right: 20px">共<%=coll == null ? 0 : coll.size()%>条记录</td>
                                                </tr>
                                                <%}%>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <%@ include file="copyright.jsp" %>
                </td>
            </tr>
        </table>
    </td>

</table>
</body>
</html>
