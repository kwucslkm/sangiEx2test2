<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.test2.model.MemberDAO" %>
<%@ page import="com.test.test2.model.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("utf-8");
		String custno = request.getParameter("custno");
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.saveMember(custno,custname,phone,address,joindate,grade,city);
		if (result>0){
	%>
	<script>
		alert("등록성공");
		//location.href="index.jsp";
	</script>
	<%}
	%>
</body>
</html>