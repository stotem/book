<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" import="com.actionForm.BorrowForm" errorPage="/error.jsp" %>
<%@ page import="com.actionForm.ReaderForm" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<%
    ReaderForm readerForm = (ReaderForm) request.getAttribute("readerinfo");
    Collection coll = (Collection) request.getAttribute("borrowinfo");
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
                            <td height="510" align="center" valign="top" style="padding:5px;">
                                <table width="98%" height="487" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" valign="top" class="word_orange">当前位置：图书借还 &gt; 图书续借 &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            <script language="javascript">
                                                function checkreader(form) {
                                                    if (form.barcode.value == "") {
                                                        alert("请输入读者条形码!");
                                                        form.barcode.focus();
                                                        return;
                                                    }
                                                    form.submit();
                                                }
                                            </script>
                                            <form name="form1" method="post" action="borrow.do?action=bookrenew">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0"
                                                       class="tableBorder_gray">
                                                    <tr>
                                                        <td valign="top">
                                                            <table width="100%" border="0" cellpadding="02"
                                                                   cellspacing="2" bordercolor="#E3F4F7">
                                                                <tr>
                                                                    <td height="27" bgcolor="#E3F4F7">&nbsp;<b>读者信息</b></td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" bgcolor="#E3F4F7">
                                                                        <%
                                                                            int ID = 0;
                                                                            String name = "";
                                                                            String sex = "";
                                                                            String barcode = "";
                                                                            String birthday = "";
                                                                            String paperType = "";
                                                                            String paperNO = "";
                                                                            int number = 0;
                                                                            String typename = "";
                                                                            if (readerForm != null) {
                                                                                ID = readerForm.getId().intValue();
                                                                                name = chStr.toChinese(readerForm.getName());
                                                                                sex = chStr.toChinese(readerForm.getSex());
                                                                                barcode = readerForm.getBarcode();
                                                                                birthday = readerForm.getBirthday();
                                                                                paperType = chStr.toChinese(readerForm.getPaperType());
                                                                                paperNO = readerForm.getPaperNO();
                                                                                number = readerForm.getNumber();
                                                                                typename = chStr.toChinese(readerForm.getTypename());
                                                                            }
                                                                        %>
                                                                        <table width="100%" border="0" cellpadding="0"
                                                                               cellspacing="0" bgcolor="#FFFFFF">
                                                                            <tr>
                                                                                <td width="33%">
                                                                                    <table width="100%" height="74"
                                                                                           border="0" cellpadding="0"
                                                                                           cellspacing="0">
                                                                                        <tr>
                                                                                            <td height="27" colspan="2"
                                                                                                align="center">
                                                                                                <table width="90%"
                                                                                                       height="21"
                                                                                                       border="0"
                                                                                                       cellpadding="0"
                                                                                                       cellspacing="0">
                                                                                                    <tr>
                                                                                                        <td background="Images/reader_checkbg.jpg">
                                                                                                            &nbsp;
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="8%" height="27">
                                                                                                &nbsp;</td>
                                                                                            <td width="92%">读者条形码：</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="27" colspan="2"
                                                                                                align="center"><input
                                                                                                    name="barcode"
                                                                                                    type="text"
                                                                                                    id="barcode"
                                                                                                    value="<%=barcode%>"
                                                                                                    size="24">
                                                                                                &nbsp;
                                                                                                <input name="Button"
                                                                                                       type="button"
                                                                                                       class="btn_grey"
                                                                                                       value="确定"
                                                                                                       onClick="checkreader(form1)">
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="1%" align="center"
                                                                                    valign="bottom" bgcolor="#f5f5dc"></td>
                                                                                <td width="66%" align="right">
                                                                                    <table width="96%" border="0"
                                                                                           cellpadding="0"
                                                                                           cellspacing="0">
                                                                                        <tr>
                                                                                            <td height="27">姓&nbsp;&nbsp;&nbsp;&nbsp;名：
                                                                                                <input name="readername"
                                                                                                       type="text"
                                                                                                       id="readername"
                                                                                                       value="<%=name%>">
                                                                                            </td>
                                                                                            <td>性&nbsp;&nbsp;&nbsp;&nbsp;别：
                                                                                                <input name="sex"
                                                                                                       type="text"
                                                                                                       id="sex"
                                                                                                       value="<%=sex%>">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="27">证件类型：
                                                                                                <input name="paperType"
                                                                                                       type="text"
                                                                                                       id="paperType"
                                                                                                       value="<%=paperType%>">
                                                                                            </td>
                                                                                            <td>证件号码：
                                                                                                <input name="paperNo"
                                                                                                       type="text"
                                                                                                       id="paperNo"
                                                                                                       value="<%=paperNO%>">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="27">读者类型：
                                                                                                <input name="readerType"
                                                                                                       type="text"
                                                                                                       id="readerType"
                                                                                                       value="<%=typename%>">
                                                                                            </td>
                                                                                            <td>可借数量：
                                                                                                <input name="number"
                                                                                                       type="text"
                                                                                                       id="number"
                                                                                                       value="<%=number%>"
                                                                                                       size="17">
                                                                                                册
                                                                                                &nbsp;</td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top">
                                                                        <table width="100%" height="35" border="1"
                                                                               cellpadding="0" cellspacing="0"
                                                                               bordercolor="#FFFFFF"
                                                                               bordercolorlight="#FFFFFF"
                                                                               bordercolordark="#D2E3E6"
                                                                               bgcolor="#FFFFFF">
                                                                            <tr align="center" bgcolor="#e3F4F7">
                                                                                <td width="24%" height="25"
                                                                                    bgcolor="#F0FAFB">图书名称
                                                                                </td>
                                                                                <td width="12%" bgcolor="#F0FAFB">借阅时间
                                                                                </td>
                                                                                <td width="13%" bgcolor="#F0FAFB">应还时间
                                                                                </td>
                                                                                <td width="14%" bgcolor="#F0FAFB">出版社
                                                                                </td>
                                                                                <td width="12%" bgcolor="#F0FAFB">书架
                                                                                </td>
                                                                                <td bgcolor="#F0FAFB">定价(元)</td>
                                                                                <td width="12%" bgcolor="#F0FAFB" align="center">操作
                                                                                </td>
                                                                            </tr>
                                                                            <%
                                                                                int id = 0;
                                                                                String bookname = "";
                                                                                String borrowTime = "";
                                                                                String backTime = "";
                                                                                Float price = new Float(0);
                                                                                String pubname = "";
                                                                                String bookcase = "";
                                                                                if (coll != null && !coll.isEmpty()) {
                                                                                    Iterator it = coll.iterator();
                                                                                    while (it.hasNext()) {
                                                                                        BorrowForm borrowForm = (BorrowForm) it.next();
                                                                                        id = borrowForm.getId().intValue();
                                                                                        bookname = chStr.toChinese(borrowForm.getBookName());
                                                                                        borrowTime = borrowForm.getBorrowTime();
                                                                                        backTime = borrowForm.getBackTime();
                                                                                        price = borrowForm.getPrice();
                                                                                        pubname = chStr.toChinese(borrowForm.getPubName());
                                                                                        bookcase = chStr.toChinese(borrowForm.getBookcaseName());
                                                                            %>
                                                                            <tr>
                                                                                <td height="25" style="padding:5px;">
                                                                                    &nbsp;<%=bookname%>
                                                                                </td>
                                                                                <td style="padding:5px;">
                                                                                    &nbsp;<%=borrowTime%>
                                                                                </td>
                                                                                <td style="padding:5px;">
                                                                                    &nbsp;<%=backTime%>
                                                                                </td>
                                                                                <td align="center">&nbsp;<%=pubname%>
                                                                                </td>
                                                                                <td align="center">&nbsp;<%=bookcase%>
                                                                                </td>
                                                                                <td width="13%" align="center">
                                                                                    &nbsp;<%=price%>
                                                                                </td>
                                                                                <td width="12%" align="center"><a
                                                                                        href="borrow.do?action=bookrenew&barcode=<%=barcode%>&id=<%=id%>">续借</a>&nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <% }
                                                                            } else {%>
                                                                            <tr>
                                                                                <td colspan="7" height="25" align="center" style="padding:5px;">&nbsp;<%=(readerForm != null) ?"<b style='color:#ff0000'>您暂无借阅的记录.</b>":"请输入读者条形码查询借阅信息"%></td>
                                                                            </tr>
                                                                            <%}%>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>
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
