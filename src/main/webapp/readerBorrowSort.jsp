<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" import="com.actionForm.BorrowForm" errorPage="/error.jsp" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<html>
<%
    Collection coll = (Collection) request.getAttribute("readerBorrowSort");
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
                                        <td height="22" valign="top" class="word_orange">当前位置：排行榜 &gt; 读者借阅排行榜 &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                        %>
                                            <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">暂无读者借阅信息！</td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {
                                                //通过迭代方式显示数据
                                                Iterator it = coll.iterator();
                                                int degree = 0;
                                                String readername = "";
                                                String typename = "";
                                                String barcode_reader = "";
                                                String paperType = "";
                                                String paperNo = "";
                                                String tel = "";
                                                String sex = "";
                                            %>
                                            <table width="98%" border="1" cellpadding="0" cellspacing="0"
                                                   bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
                                                   bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td height="35" width="8%">借阅次数</td>
                                                    <td width="11%">读者条形码</td>
                                                    <td width="12%">读者姓名</td>
                                                    <td width="13%">读者类型</td>
                                                    <td width="23%">证件类型</td>
                                                    <td width="14%">证件号码</td>
                                                    <td width="12%">电话</td>
                                                    <td colspan="2">性别</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        BorrowForm borrowForm = (BorrowForm) it.next();
                                                        readername = chStr.toChinese(borrowForm.getReaderName());
                                                        barcode_reader = borrowForm.getReaderBarcode();
                                                        typename = chStr.toChinese(borrowForm.getReaderType());
                                                        degree = borrowForm.getDegree();
                                                        paperType = chStr.toChinese(borrowForm.getPaperType());
                                                        paperNo = borrowForm.getPaperNo();
                                                        tel = borrowForm.getTel();
                                                        sex = chStr.toChinese(borrowForm.getSex());
                                                %>
                                                <tr>
                                                    <td align="center">&nbsp;<%=degree%>
                                                    </td>
                                                    <td style="padding:5px;">&nbsp;<%=barcode_reader%>
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
