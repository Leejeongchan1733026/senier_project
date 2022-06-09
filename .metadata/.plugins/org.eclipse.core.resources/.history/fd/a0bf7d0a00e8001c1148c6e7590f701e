<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.Review" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="review" class="review.Review" scope="page" />
<jsp:setProperty name="review" property="SCORE" />
<jsp:setProperty name="review" property="POST_NUM" />
<jsp:setProperty name="review" property="POSTING_DATE" />
<jsp:setProperty name="review" property="REVIEW_CONTENTS" />
<jsp:setProperty name="review" property="NICKNAME" />
<jsp:setProperty name="review" property="EMAIL" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ReviewDAO reviewDAO = new ReviewDAO();
		int result = reviewDAO.reviewWirte(review);
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
			script.println("alert('리뷰를 작성하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
			reviewDAO.reviewAvgUpdate(review);
		}
	%>

</body>
</html>