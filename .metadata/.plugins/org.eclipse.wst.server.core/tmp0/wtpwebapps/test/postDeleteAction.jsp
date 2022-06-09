<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="post.PostDAO" %>
<%@ page import="post.Post" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="post" class="post.Post" scope="page" />
<jsp:setProperty name="post" property="POST_NUM" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int postID = 0;
		if (request.getParameter("postID") != null){
			postID = Integer.parseInt(request.getParameter("postID"));
		}
		if (postID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 게시글 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	
		PostDAO postDAO = new PostDAO();
		int result = postDAO.postDelete(postID);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글이 삭제되었습니다.')");
			script.println("location.href = 'myPostView.jsp'");
			script.println("</script>");
		}
	%>

</body>
</html>