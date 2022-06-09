<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="ID" />
<jsp:setProperty name="user" property="PASSWORD" />
<jsp:setProperty name="user" property="NAME" />
<jsp:setProperty name="user" property="EMAIL" />
<jsp:setProperty name="user" property="PHONE_NUM" />
<jsp:setProperty name="user" property="NICKNAME" />
<jsp:setProperty name="user" property="ADDRESS" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.register(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복된 이메일 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			session.setAttribute("ID", user.getID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입에 성공하였습니다.')");
			script.println("location.href = 'login.html'");
			script.println("</script>");
		}
	%>

</body>
</html>