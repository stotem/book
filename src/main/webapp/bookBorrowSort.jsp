<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" import="com.actionForm.BorrowForm" errorPage="/error.jsp" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<%
    Collection coll = (Collection) request.getAttribute("bookBorrowSort");
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
                                        <td height="22" valign="top" class="word_orange">当前位置：排行榜 &gt; 图书借阅排行榜 &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                        %>
                                            <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">暂无图书借阅信息！</td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {
                                                //通过迭代方式显示数据
                                                Iterator it = coll.iterator();
                                                int degree = 0;
                                                String bookname = "";
                                                String typename = "";
                                                String barcode_book = "";
                                                String bookcase = "";
                                                String pub = "";
                                                String author = "";
                                                String translator = "";
                                                Float price = new Float(0);
                                            %>
                                            <table width="98%" border="1" cellpadding="0" cellspacing="0"
                                                   bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
                                                   bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td height="35" width="8%">借阅次数</td>
                                                    <td width="11%">图书条形码</td>
                                                    <td width="17%">图书名称</td>
                                                    <td width="15%">图书类型</td>
                                                    <td width="16%">书架</td>
                                                    <td width="14%">出版社</td>
                                                    <td width="11%">作者</td>
                                                    <td colspan="2">定价(元)</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        BorrowForm borrowForm = (BorrowForm) it.next();
                                                        bookname = chStr.toChinese(borrowForm.getBookName());
                                                        barcode_book = borrowForm.getBookBarcode();
                                                        typename = chStr.toChinese(borrowForm.getBookType());
                                                        degree = borrowForm.getDegree();
                                                        bookcase = chStr.toChinese(borrowForm.getBookcaseName());
                                                        pub = chStr.toChinese(borrowForm.getPubName());
                                                        author = chStr.toChinese(borrowForm.getAuthor());
                                                        price = borrowForm.getPrice();
                                                %>
                                                <tr>
                                                    <td align="center">&nbsp;<%=degree%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=barcode_book%>
                                                    </td>
                                                    <td style="padding:5px;"><%=bookname%>
                                                    </td>
                                                    <td style="padding:5px;"><%=typename%>
                                                    </td>
                                                    <td align="center">&nbsp;<%=bookcase%>
                                                    </td>
                                                    <td align="center">&nbsp;<%=pub%>
                                                    </td>
                                                    <td width="11%" align="center"><%=author%>
                                                    </td>
                                                    <td width="8%" align="center"><%=price%>
                                                    </td>
                                                </tr>
                                                <%
                                                        }
                                                %>
                                                <tr align="right" bgcolor="#e3F4F7">
                                                    <td colspan="8" height="35" style="padding-right: 20px">共<%=coll == null ? 0 : coll.size()%>条记录</td>
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
