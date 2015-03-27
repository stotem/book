<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.actionForm.BorrowForm" %>
<%@ page import="com.dao.BorrowDAO" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <title>图书馆管理系统</title>
    <link href="CSS/style.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body onLoad="clockon(bgclock)">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
    <tr>
        <td height="183">
            <%@include file="navigation.jsp" %>
        </td>
    </tr>
    <td bgcolor="#FFFFFF">
        <%
            BorrowDAO borrowDAO = new BorrowDAO();
            Collection coll_reader = (Collection) borrowDAO.readerBorrowSort();
            Collection coll_book = (Collection) borrowDAO.bookBorrowSort();
        %>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" bgcolor="#FFFFFF">
                    <table width="99%" height="510" border="0" align="center" cellpadding="0" cellspacing="0"
                           bgcolor="#FFFFFF" class="tableBorder_gray">
                        <tr>
                            <td align="center" valign="top" style="padding:5px;">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>

                                        <td height="20" align="right" valign="middle" class="word_orange">

                                            当前位置：首页 &gt;&gt;&gt;&nbsp;</td>

                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="57" background="Images/main_booksort.gif">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td height="72" valign="top"
                                                        background="Images/main_booksort_1.gif">
                                                        <table width="100%" height="63" border="0" cellpadding="0"
                                                               cellspacing="0">
                                                            <tr>
                                                                <td width="2%">&nbsp;</td>
                                                                <td width="96%" align="center" valign="top">
                                                                    <table width="100%" border="1" cellpadding="0"
                                                                           cellspacing="0" bordercolor="#FFFFFF"
                                                                           bordercolordark="#D2E3E6"
                                                                           bordercolorlight="#FFFFFF">
                                                                        <tr align="center">
                                                                            <td width="6%" height="25">排名</td>
                                                                            <td width="11%">图书条形码</td>
                                                                            <td width="17%">图书名称</td>
                                                                            <td width="15%">图书类型</td>
                                                                            <td width="16%">书架</td>
                                                                            <td width="14%">出版社</td>
                                                                            <td width="11%">作者</td>
                                                                            <td colspan="2">定价(元)</td>
                                                                        </tr>
                                                                        <%
                                                                            if (coll_book != null && !coll_book.isEmpty()) {
                                                                                Iterator it_book = coll_book.iterator();
                                                                                int i = 1;
                                                                                int degree = 0;
                                                                                String bookname = "";
                                                                                String typename = "";
                                                                                String barcode_book = "";
                                                                                String bookcase = "";
                                                                                String pub = "";
                                                                                String author = "";
                                                                                String translator = "";
                                                                                Float price = new Float(0);
                                                                                while (it_book.hasNext() && i < 6) {
                                                                                    BorrowForm borrowForm = (BorrowForm) it_book.next();
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
                                                                            <td height="25" align="center"><%=i%>
                                                                            </td>
                                                                            <td style="padding:5px;">
                                                                                &nbsp;<%=barcode_book%>
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
                                                                                    i++;
                                                                                }
                                                                            }%>
                                                                    </table>

                                                                    <table width="100%" border="0" cellspacing="0"
                                                                           cellpadding="0">
                                                                        <tr>
                                                                            <td height="39" align="right"><a
                                                                                    href=borrow.do?action=bookBorrowSort><img
                                                                                    src="Images/more.GIF" width="50"
                                                                                    height="20" border="0"></a></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="2%">&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="19" background="Images/main_booksort_2.gif">&nbsp;</td>
                                                </tr>
                                            </table>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="57" background="Images/main_readersort_1.gif">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td height="72" valign="top"
                                                        background="Images/main_booksort_1.gif">
                                                        <table width="100%" height="63" border="0" cellpadding="0"
                                                               cellspacing="0">
                                                            <tr>
                                                                <td width="2%">&nbsp;</td>
                                                                <td width="96%" align="center" valign="top">
                                                                    <table width="100%" border="1" cellpadding="0"
                                                                           cellspacing="0" bordercolor="#FFFFFF"
                                                                           bordercolordark="#eeeeee"
                                                                           bordercolorlight="#FFFFFF">
                                                                        <tr align="center" bordercolordark="#D2E3E6">
                                                                            <td width="6%" height="25" align="center">
                                                                                排名
                                                                            </td>
                                                                            <td width="11%">读者条形码</td>
                                                                            <td width="12%">读者姓名</td>
                                                                            <td width="13%">读者类型</td>
                                                                            <td width="23%">证件类型</td>
                                                                            <td width="14%">证件号码</td>
                                                                            <td width="12%">电话</td>
                                                                            <td colspan="2">性别</td>
                                                                        </tr>
                                                                        <%
                                                                            if (coll_book != null && !coll_book.isEmpty()) {
                                                                                Iterator it_reader = coll_reader.iterator();
                                                                                int j = 1;
                                                                                String readername = "";
                                                                                String typename = "";
                                                                                String barcode_reader = "";
                                                                                String paperType = "";
                                                                                String paperNo = "";
                                                                                String tel = "";
                                                                                String sex = "";
                                                                                while (it_reader.hasNext() && j < 6) {
                                                                                    BorrowForm borrowForm = (BorrowForm) it_reader.next();
                                                                                    readername = chStr.toChinese(borrowForm.getReaderName());
                                                                                    barcode_reader = borrowForm.getReaderBarcode();
                                                                                    typename = chStr.toChinese(borrowForm.getReaderType());
                                                                                    paperType = chStr.toChinese(borrowForm.getPaperType());
                                                                                    paperNo = borrowForm.getPaperNo();
                                                                                    tel = borrowForm.getTel();
                                                                                    sex = chStr.toChinese(borrowForm.getSex());

                                                                        %>
                                                                        <tr>
                                                                            <td height="25" align="center"><%=j%>
                                                                            </td>
                                                                            <td style="padding:5px;">
                                                                                &nbsp;<%=barcode_reader%>
                                                                            </td>
                                                                            <td style="padding:5px;"><%=readername%>
                                                                            </td>
                                                                            <td style="padding:5px;"><%=typename%>
                                                                            </td>
                                                                            <td align="center">&nbsp;<%=paperType%>
                                                                            </td>
                                                                            <td align="center">&nbsp;<%=paperNo%>
                                                                            </td>
                                                                            <td width="12%" align="center"><%=tel%>
                                                                            </td>
                                                                            <td width="7%" align="center"><%=sex%>
                                                                            </td>
                                                                        </tr>
                                                                        <%
                                                                                    j++;
                                                                                }
                                                                            }%>
                                                                    </table>
                                                                    <table width="100%" height="42" border="0"
                                                                           cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td height="35" align="right"><a
                                                                                    href=borrow.do?action=readerBorrowSort><img
                                                                                    src="Images/more.GIF" width="50"
                                                                                    height="20" border="0"></a></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="2%">&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="19" background="Images/main_booksort_2.gif">&nbsp;</td>
                                                </tr>
                                            </table>
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

</table>
</body>
</html>
