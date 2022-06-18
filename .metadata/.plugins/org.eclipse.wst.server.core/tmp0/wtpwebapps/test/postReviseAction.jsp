<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="post.PostDAO" %>
<%@ page import="post.Post" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="post" class="post.Post" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	PostDAO postDAO = new PostDAO();
	int maxImageSize = 100*1024*1024;
	String endCodingType = "UTF-8";
	String directory = "C:/Users/com/Desktop/spaceZ/test/src/main/webapp/images/mainImage";
	MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxImageSize, endCodingType, new DefaultFileRenamePolicy());
	String fileName = multipartRequest.getFilesystemName("upLoadFile");
	post.setTITLE(multipartRequest.getParameter("TITLE"));
	post.setINFO(multipartRequest.getParameter("INFO"));
	post.setPOST_NUM(multipartRequest.getParameter("POST_NUM"));
	post.setPOST_CONTENTS(multipartRequest.getParameter("POST_CONTENTS"));
	post.setADDRESS(multipartRequest.getParameter("ADDRESS"));
	post.setPRICE(multipartRequest.getParameter("PRICE"));
	post.setRENTAL_TIME(multipartRequest.getParameter("RENTAL_TIME"));
	if(fileName != null){
		post.setPHOTO(fileName);
	} else {
		postDAO.getPostDetail(Integer.parseInt(multipartRequest.getParameter("POST_NUM")));
		Post postNUM = postDAO.getPostDetail(Integer.parseInt(multipartRequest.getParameter("POST_NUM")));
		post.setPHOTO(postNUM.getPHOTO());
		System.out.println(postNUM.getPHOTO());
	}
	int result = postDAO.postRevise(post);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정에 실패하였습니다.')");
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