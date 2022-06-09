<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reserve.Reserve" %>
<%@ page import="reserve.ReserveDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="reserve" class="reserve.Reserve" scope="page" />
<jsp:setProperty name="reserve" property="POST_NUM" />
<jsp:setProperty name="reserve" property="EMAIL" />
<jsp:setProperty name="reserve" property="POST_TITLE" />
<jsp:setProperty name="reserve" property="PRICE" />
<jsp:setProperty name="reserve" property="RESERVE_DATE" />
<jsp:setProperty name="reserve" property="RENT_USEREMAIL" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ReserveDAO reserveDAO = new ReserveDAO();
		int result = reserveDAO.reserve(reserve);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('다른 날짜를 선택해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약에 성공하였습니다.')");
			script.println("location.href = 'reserveView.jsp'");
			script.println("</script>");
		}
	%>

</body>
</html>