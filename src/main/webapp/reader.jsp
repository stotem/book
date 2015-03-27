<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" import="com.actionForm.ReaderForm" errorPage="/error.jsp" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<%
    Collection coll = (Collection) request.getAttribute("reader");
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
                                        <td height="22" valign="top" class="word_orange">当前位置：读者管理 &gt; 读者档案管理 &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                        %>
                                            <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">暂无读者信息！</td>
                                                </tr>
                                            </table>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="35">
                                                        <a href="reader_add.jsp">添加读者信息</a></td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {
                                                //通过迭代方式显示数据
                                                Iterator it = coll.iterator();
                                                int ID = 0;
                                                String name = "";
                                                String typename = "";
                                                String barcode = "";
                                                String paperType = "";
                                                String paperNO = "";
                                                String tel = "";
                                                String email = "";
                                            %>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="87%">&nbsp;      </td>
                                                    <td width="13%" height="35">
                                                        <a href="reader_add.jsp">添加读者信息</a></td>
                                                </tr>
                                            </table>
                                            <table width="95%" border="1" cellpadding="0" cellspacing="0"
                                                   bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
                                                   bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td height="35" width="13%">条形码</td>
                                                    <td width="10%">姓名</td>
                                                    <td width="8%">读者类型</td>
                                                    <td width="12%">证件类型</td>
                                                    <td width="20%">证件号码</td>
                                                    <td width="12%">电话</td>
                                                    <td width="15%">Email</td>
                                                    <td width="10%" colspan="2">操作</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        ReaderForm readerForm = (ReaderForm) it.next();
                                                        ID = readerForm.getId().intValue();
                                                        name = chStr.toChinese(readerForm.getName());
                                                        barcode = readerForm.getBarcode();
                                                        typename = chStr.nullToString(chStr.toChinese(readerForm.getTypename()), "&nbsp;");
                                                        paperType = chStr.toChinese(readerForm.getPaperType());
                                                        paperNO = chStr.nullToString(readerForm.getPaperNO(), "&nbsp;");
                                                        tel = chStr.nullToString(readerForm.getTel(), "&nbsp;");
                                                        email = chStr.nullToString(readerForm.getEmail(), "&nbsp;");
                                                %>
                                                <tr>
                                                    <td style="padding:5px;"><%=barcode%>
                                                    </td>
                                                    <td style="padding:5px;"><a
                                                            href="reader.do?action=readerDetail&ID=<%=ID%>"><%=name%>
                                                    </a></td>
                                                    <td style="padding:5px;"><%=typename%>
                                                    </td>
                                                    <td align="center"><%=paperType%>
                                                    </td>
                                                    <td align="center"><%=paperNO%>
                                                    </td>
                                                    <td align="center"><%=tel%>
                                                    </td>
                                                    <td align="center"><%=email%>
                                                    </td>
                                                    <td align="center"><a
                                                            href="reader.do?action=readerModifyQuery&ID=<%=ID%>">修改</a>
                                                    </td>
                                                    <td align="center"><a href="reader.do?action=readerDel&ID=<%=ID%>" onclick="return window.confirm('温馨提示:您正在执行数据删除操作，确定继续？')">删除</a>
                                                    </td>
                                                </tr>
                                                <%}%>
                                                <tr align="right" bgcolor="#e3F4F7">
                                                    <td colspan="9" height="35" style="padding-right: 20px">共<%=coll == null ? 0 : coll.size()%>条记录</td>
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
