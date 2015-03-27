<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" import="com.actionForm.BorrowForm" errorPage="/error.jsp" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<%
    Collection coll = (Collection) request.getAttribute("Bremind");
%>
<head>
    <title>图书馆管理系统</title>
    <link href="CSS/style.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body onLoad="clockon(bgclock)">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder">
    <tr>
        <td height="183">
            <%@include file="navigation.jsp" %>
        </td>
    </tr>
    <td bgcolor="#FFFFFF">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
            <tr>
                <td valign="top" bgcolor="#FFFFFF">
                    <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0"
                           bgcolor="#FFFFFF" class="tableBorder_gray">
                        <tr>
                            <td height="510" valign="top" style="padding:5px;">
                                <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" valign="top" class="word_orange">当前位置：系统查询 &gt; 借阅到期提醒 &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                        %>
                                            <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">暂无到期提醒信息！</td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {
                                                //通过迭代方式显示数据
                                                Iterator it = coll.iterator();
                                                String bookname = "";
                                                String bookbarcode = "";
                                                String readerbar = "";
                                                String readername = "";
                                                String borrowTime = "";
                                                String backTime = "";
                                            %>
                                            <table width="98%" border="1" cellpadding="0" cellspacing="0"
                                                   bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
                                                   bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td height="35" width="15%">图书条形码</td>
                                                    <td width="28%">图书名称</td>
                                                    <td width="17%">读者条形码</td>
                                                    <td width="9%">读者名称</td>
                                                    <td width="15%">借阅时间</td>
                                                    <td width="16%">应还时间</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        BorrowForm borrowForm = (BorrowForm) it.next();
                                                        bookname = chStr.toChinese(borrowForm.getBookName());
                                                        bookbarcode = borrowForm.getBookBarcode();
                                                        readerbar = chStr.toChinese(borrowForm.getReaderBarcode());
                                                        readername = chStr.toChinese(borrowForm.getReaderName());
                                                        borrowTime = borrowForm.getBorrowTime();
                                                        backTime = borrowForm.getBackTime();
                                                %>
                                                <tr>
                                                    <td style="padding:5px;">&nbsp;<%=bookbarcode%>
                                                    </td>
                                                    <td style="padding:5px;"><%=bookname%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=readerbar%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=readername%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=borrowTime%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=backTime%>
                                                    </td>
                                                </tr>
                                                <%
                                                        }

                                                %>
                                                <tr align="right" bgcolor="#e3F4F7">
                                                    <td colspan="6" height="35" style="padding-right: 20px">共<%=coll == null ? 0 : coll.size()%>条记录</td>
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
