<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" import="com.actionForm.BookCaseForm" errorPage="/error.jsp" %>
<%@ page import="com.actionForm.BookTypeForm" %>
<%@ page import="com.actionForm.PublishingForm" %>
<%@ page import="com.dao.BookCaseDAO" %>
<%@ page import="com.dao.BookTypeDAO" %>
<%@ page import="com.dao.PublishingDAO" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<%
    String str = null;
    BookTypeDAO bookTypeDAO = new BookTypeDAO();
    Collection coll_type = (Collection) bookTypeDAO.query(str);
    if (coll_type == null || coll_type.isEmpty()) {
        out.println("<script>alert('请先录入图书类型信息!');history.back(-1);</script>");
    } else {
        Iterator it_type = coll_type.iterator();
        int typeID = 0;
        String typename = "";
        BookCaseDAO bookcaseDAO = new BookCaseDAO();
        String str1 = null;
        Collection coll_bookcase = (Collection) bookcaseDAO.query(str1);
        if (coll_bookcase == null || coll_bookcase.isEmpty()) {
            out.println("<script>alert('请先录入书架信息!');history.back(-1);</script>");
        } else {
            Iterator it_bookcase = coll_bookcase.iterator();
            int bookcaseID = 0;
            String bookcasename = "";
            PublishingDAO pubDAO = new PublishingDAO();
            String str2 = null;
            Collection coll_pub = (Collection) pubDAO.query(str2);
            if (coll_pub == null || coll_pub.isEmpty()) {
                out.println("<script>alert('请先录入出版社信息!');history.back(-1);</script>");
            } else {
                Iterator it_pub = coll_pub.iterator();
                String isbn = "";
                String pubname = "";
%>
<script language="jscript">
    function check(form) {
        if (form.barcode.value == "") {
            alert("请输入条形码1!");
            form.barcode.focus();
            return false;
        }
        if (form.bookName.value == "") {
            alert("请输入图书姓名!");
            form.bookName.focus();
            return false;
        }
        if (form.price.value == "") {
            alert("请输入图书定价!");
            form.price.focus();
            return false;
        }
    }
</script>
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
                                        <td height="22" valign="top" class="word_orange">当前位置：图书管理 &gt; 图书档案管理 &gt;
                                            添加图书信息 &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            <table width="100%" height="493" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="center" valign="top">
                                                        <form name="form1" method="post"
                                                              action="book.do?action=bookAdd">
                                                            <table width="600" height="432" border="0" cellpadding="0"
                                                                   cellspacing="0" bgcolor="#FFFFFF">
                                                                <tr>
                                                                    <td width="173" align="center">条&nbsp;形&nbsp;码：</td>
                                                                    <td width="427" height="39">
                                                                        <input name="barcode" type="text" id="barcode">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">图书名称：</td>
                                                                    <td height="39"><input name="bookName" type="text"
                                                                                           id="bookName" size="50">
                                                                        *
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">图书类型：</td>
                                                                    <td>
                                                                        <select name="typeId" class="wenbenkuang"
                                                                                id="typeId">
                                                                            <%
                                                                                while (it_type.hasNext()) {
                                                                                    BookTypeForm bookTypeForm = (BookTypeForm) it_type.next();
                                                                                    typeID = bookTypeForm.getId().intValue();
                                                                                    typename = chStr.toChinese(bookTypeForm.getTypeName());
                                                                            %>

                                                                            <option value="<%=typeID%>"><%=typename%>
                                                                            </option>
                                                                            <%}%>
                                                                        </select></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">作者：</td>
                                                                    <td><input name="author" type="text" id="author"
                                                                               size="40"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">译者：</td>
                                                                    <td><input name="translator" type="text"
                                                                               id="translator" size="40"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">出版社：</td>
                                                                    <td><select name="isbn" class="wenbenkuang">
                                                                        <%
                                                                            while (it_pub.hasNext()) {
                                                                                PublishingForm pubForm = (PublishingForm) it_pub.next();
                                                                                isbn = pubForm.getIsbn();
                                                                                pubname = chStr.toChinese(pubForm.getPubname());
                                                                        %>

                                                                        <option value="<%=isbn%>"><%=pubname%>
                                                                        </option>
                                                                        <%}%>
                                                                    </select></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">价格：</td>
                                                                    <td><input name="price" type="text" id="price">
                                                                        (元)
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">页码：</td>
                                                                    <td><input name="page" type="text" id="page"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">书架：</td>
                                                                    <td><select name="bookcaseid" class="wenbenkuang"
                                                                                id="bookcaseid">
                                                                        <%
                                                                            while (it_bookcase.hasNext()) {
                                                                                BookCaseForm bookCaseForm = (BookCaseForm) it_bookcase.next();
                                                                                bookcaseID = bookCaseForm.getId().intValue();
                                                                                bookcasename = chStr.toChinese(bookCaseForm.getName());
                                                                        %>

                                                                        <option value="<%=bookcaseID%>"><%=bookcasename%>
                                                                        </option>
                                                                        <%}%>
                                                                    </select>
                                                                        <input name="operator" type="hidden"
                                                                               id="operator"
                                                                               value="<%=chStr.toChinese(manager)%>">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">库存总量：</td>
                                                                    <td><input name="storage" type="text" id="storage">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">&nbsp;</td>
                                                                    <td><input name="Submit" type="submit"
                                                                               class="btn_grey" value="保存"
                                                                               onClick="return check(form1)">
                                                                        &nbsp;
                                                                        <input name="Submit2" type="button"
                                                                               class="btn_grey" value="返回"
                                                                               onClick="history.back()"></td>
                                                                </tr>
                                                            </table>
                                                        </form>
                                                    </td>
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
<%
            }
        }
    }
%>
</body>
</html>
