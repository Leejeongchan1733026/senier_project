<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="post.PostDAO" %>
<%@ page import="post.Post" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="post" class="post.Post" scope="page" />
<jsp:setProperty name="post" property="TITLE" />
<jsp:setProperty name="post" property="INFO" />
<jsp:setProperty name="post" property="ID" />
<jsp:setProperty name="post" property="POST_CONTENTS" />
<jsp:setProperty name="post" property="ADDRESS" />
<jsp:setProperty name="post" property="PRICE" />
<jsp:setProperty name="post" property="RENTAL_TIME" />
<jsp:setProperty name="post" property="POST_NUM" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		PostDAO postDAO = new PostDAO();
		int result = postDAO.postRevise(post);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('작성에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글을 수정하였습니다.')");
			script.println("location.href = 'searchmain.jsp'");
			script.println("</script>");
		}
	%>

</body>
</html>