<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Untitled Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<%
    session.invalidate();
    out.println("<script language='javascript'>");
    out.println("window.location.href='login.jsp'");
    out.println("</script>");
%>


</body>
</html>
