<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.actionForm.ManagerForm" %>
<%@ page import="com.core.ChStr" %>
<%@ page import="com.dao.ManagerDAO" %>
<%
    //验证用户是否登录
    String manager = "";
    manager = (String) session.getAttribute("manager");
    if (manager == null || "".equals(manager)) {
        response.sendRedirect("login.jsp");
    }
    ChStr chStr = new ChStr();
    ManagerDAO managerDAO = new ManagerDAO();
    ManagerForm form1 = (ManagerForm) managerDAO.query_p(manager);
    int sysset1 = 0;
    int readerset1 = 0;
    int bookset1 = 0;
    int borrowback1 = 0;
    int sysquery1 = 0;
    if (form1 != null) {
        sysset1 = form1.getSysset();
        readerset1 = form1.getReaderset();
        bookset1 = form1.getBookset();
        borrowback1 = form1.getBorrowback();
        sysquery1 = form1.getSysquery();
    }
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="JS/onclock.JS"></script>
<script src="JS/menu.JS"></script>
<script language="javascript">
    function mycheck() {
    }
</script>
<div class=menuskin id=popmenu
     onmouseover="clearhidemenu();highlightmenu(event,'on')"
     onmouseout="highlightmenu(event,'off');dynamichide(event)"
     style="Z-index:100;position:absolute;"></div>
<table width="778" border="0" align="center" cellpadding="0"
       cellspacing="0">
    <tr>
        <td height="150" valign="top" background="Images/top_bg.gif"
            bgcolor="#EEEEEE">
            <table width="100%" height="53" border="0" cellpadding="0"
                   cellspacing="0">
                <tr>
                    <td width="77%" height="18">&nbsp;

                    </td>
                    <td colspan="4">&nbsp;

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;

                    </td>
                    <td width="2%">
                        <img src="Images/Top_flag.gif" width="3" height="7">
                    </td>
                    <td width="8%">
                        <a href="#" onClick="window.location.reload();">刷新页面</a>
                    </td>
                    <td width="1%">
                        <img src="Images/Top_flag.gif" width="3" height="7">
                    </td>
                    <script language="javascript">
                        function myclose() {
                            if (confirm("真的要关闭当前窗口吗?")) {
                                window.close();
                            }
                        }
                    </script>
                    <td width="12%">
                        <a href="#" onClick="myclose()">关闭系统</a>
                    </td>
                </tr>
            </table>
            <table width="98%" height="93" border="0" cellpadding="0"
                   cellspacing="0">
                <tr>
                    <td align="right" valign="bottom" class="word_Green">
                        当前登录用户：
                        <%=chStr.toChinese(manager)%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="33" align="right" background="Images/navigation_bg.gif"
            bgcolor="#EEEEEE">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="3%">&nbsp;

                    </td>
                    <td width="25%">
                        <div id="bgclock" class="word_Green"></div>
                    </td>
                    <script language="javascript">
                        function quit() {
                            if (confirm("真的要退出系统吗?")) {
                                window.location.href = "logout.jsp";
                            }
                        }
                    </script>
                    <td width="70%" align="right">
                        <a href="main.jsp">首页</a>┊
                        <%
                            if (borrowback1 == 1) {
                        %>
                        <a href="bookBorrow.jsp">借阅</a>┊
                        <%
                            }
                        %>
                        <%
                            if (borrowback1 == 1) {
                        %>
                        <a href="bookRenew.jsp">续借</a>┊
                        <%
                            }
                        %>
                        <%
                            if (borrowback1 == 1) {
                        %>
                        <a href="bookBack.jsp">归还</a>┊
                        <%
                            }
                        %>

                        <%
                            if (readerset1 == 1) {
                        %>
                        <a onmouseover=showmenu(event,readermenu)
                           onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand">读者管理</a>┊
                        <%
                            }
                        %>
                        <%
                            if (bookset1 == 1) {
                        %>
                        <a onmouseover=showmenu(event,bookmenu) onmouseout=delayhidemenu()
                           class='navlink' style="CURSOR:hand">图书管理</a>┊
                        <%
                            }
                        %>
                        <%--<%
                        if (borrowback1 == 1) {
                        %>
                        <a onmouseover=showmenu(event,borrowmenu)
                            onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand">图书借还</a>┊
                        <%
                        }
                        %>
                        --%><%
						if (sysquery1 == 1) {
						%>
                        <a onmouseover=showmenu(event,querymenu)
                           onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand">系统查询</a>┊
                        <%
                            }
                        %>
                        <a onmouseover=showmenu(event,sortmenu) onmouseout=delayhidemenu()
                           class='navlink' style="CURSOR:hand">排行榜</a>┊
                        <%--<a href="manager.do?action=querypwd">更改口令</a>┊
                        --%>
                        <%
                            if (sysset1 == 1) {
                        %>
                        <a onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu()
                           class='navlink' style="CURSOR:hand">系统设置</a>┊
                        <%
                            }
                        %>
                        <a href="#" onClick="quit()">退出系统</a>
                    </td>
                    <td width="2%">&nbsp;

                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
