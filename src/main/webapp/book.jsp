<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" import="com.actionForm.BookForm" errorPage="/error.jsp" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<%
    Collection coll = (Collection) request.getAttribute("book");
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
                                <table width="98%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" valign="top" class="word_orange">当前位置：图书管理 &gt; 图书档案管理 &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                        %>
                                            <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">暂无图书信息！</td>
                                                </tr>
                                            </table>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="35">
                                                        <a href="book_add.jsp" >添加图书信息</a></td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {
                                                //通过迭代方式显示数据
                                                Iterator it = coll.iterator();
                                                int ID = 0;
                                                String bookname = "";
                                                String barcode = "";
                                                String typename = "";
                                                String publishing = "";
                                                String bookcase = "";
                                                int storage = 0;
                                            %>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="87%">&nbsp;      </td>
                                                    <td width="13%" height="35">
                                                        <a href="book_add.jsp">添加图书信息</a></td>
                                                </tr>
                                            </table>
                                            <table width="98%" border="1" cellpadding="0" cellspacing="0"
                                                   bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
                                                   bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7" >
                                                    <td height="25" width="13%">条形码</td>
                                                    <td >图书名称</td>
                                                    <td width="10%">图书类型</td>
                                                    <td width="10%">出版社</td>
                                                    <td width="12%">书架</td>
                                                    <td width="8%">单价(元)</td>
                                                    <td width="9%">库存总数</td>
                                                    <td colspan="2" width="11%">操作</td>
                                                </tr>

                                                <%
                                                    while (it.hasNext()) {
                                                        BookForm bookForm = (BookForm) it.next();
                                                        ID = bookForm.getId().intValue();
                                                        bookname = chStr.toChinese(bookForm.getBookName());
                                                        barcode = chStr.nullToString(bookForm.getBarcode(), "&nbsp;");
                                                        typename = chStr.toChinese(bookForm.getTypeName());
                                                        publishing = chStr.toChinese(bookForm.getPublishing());
                                                        bookcase = chStr.nullToString(chStr.toChinese(bookForm.getBookcaseName()), "&nbsp;");
                                                        storage = bookForm.getStorage();
                                                %>
                                                <tr>
                                                    <td style="padding:5px;">&nbsp;<%=barcode%>
                                                    </td>
                                                    <td style="padding:5px;"><a
                                                            href="book.do?action=bookDetail&ID=<%=ID%>"><%=bookname%>
                                                    </a></td>
                                                    <td style="padding:5px;">&nbsp;<%=typename%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=publishing%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=bookcase%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=bookForm.getPrice()%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=storage%>(本)</td>
                                                    <td align="center"><a
                                                            href="book.do?action=bookModifyQuery&ID=<%=ID%>">修改</a></td>
                                                    <td align="center"><a
                                                            href="book.do?action=bookDel&ID=<%=ID%>" onclick="return window.confirm('温馨提示:您正在执行数据删除操作，确定继续？')">删除</a></td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>
                                                <tr align="right" bgcolor="#e3F4F7">
                                                    <td colspan="9" height="35" style="padding-right: 20px">共<%=coll == null ? 0 : coll.size()%>条记录</td>
                                                </tr>
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
