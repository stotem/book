<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" import="com.actionForm.BookCaseForm" errorPage="/error.jsp" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<%
    Collection coll = (Collection) request.getAttribute("bookcase");
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
                                        <td height="22" valign="top" class="word_orange">当前位置：系统设置 &gt; 书架设置 &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                        %>
                                            <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">暂无书架信息！</td>
                                                </tr>
                                            </table>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="35">
                                                        <a href="#"
                                                           onClick="window.open('bookcase_add.jsp','','width=292,height=175')">添加书架信息</a>
                                                    </td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {
                                                //通过迭代方式显示数据
                                                Iterator it = coll.iterator();
                                                int ID = 0;
                                                String name = "";
                                            %>
                                            <table width="91%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="84%">&nbsp;      </td>
                                                    <td width="16%" align="right" height="35">
                                                        <a href="#"
                                                           onClick="window.open('bookcase_add.jsp','','width=292,height=175')">添加书架信息</a>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="91%" border="1" cellpadding="0" cellspacing="0"
                                                   bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
                                                   bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td height="35" width="70%">书架名称</td>
                                                    <td width="20%" colspan="2">操作</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        BookCaseForm bookCaseForm = (BookCaseForm) it.next();
                                                        ID = bookCaseForm.getId().intValue();
                                                        name = chStr.toChinese(bookCaseForm.getName());
                                                %>
                                                <tr>
                                                    <td style="padding:5px;"><%=name%>
                                                    </td>
                                                    <td align="center"><a href="#"
                                                                          onClick="window.open('bookCase.do?action=bookCaseModifyQuery&ID=<%=ID%>','','width=292,height=175')">修改</a>
                                                    </td>
                                                    <td align="center"><a
                                                            href="bookCase.do?action=bookCaseDel&ID=<%=ID%>" onclick="return window.confirm('温馨提示:您正在执行数据删除操作，确定继续？')">删除</a></td>
                                                </tr>
                                                <%
                                                        }
                                                %>
                                                <tr align="right" bgcolor="#e3F4F7">
                                                    <td colspan="3" height="35" style="padding-right: 20px">共<%=coll == null ? 0 : coll.size()%>条记录</td>
                                                </tr>
                                                <%    }%>
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
