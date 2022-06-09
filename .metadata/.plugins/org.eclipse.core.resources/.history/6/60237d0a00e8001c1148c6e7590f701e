<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reserve.Reserve" %>
<%@ page import="reserve.ReserveDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int reserveID = 0;
		if (request.getParameter("reserveID") != null){
			reserveID = Integer.parseInt(request.getParameter("reserveID"));
		}
		if (reserveID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 게시글 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		ReserveDAO reserveDAO = new ReserveDAO();
		int result = reserveDAO.reserveDelete(reserveID);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 예약입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약을 취소하였습니다.')");
			script.println("location.href = 'reserveView.jsp'");
			script.println("</script>");
		}
	%>

</body>
</html>