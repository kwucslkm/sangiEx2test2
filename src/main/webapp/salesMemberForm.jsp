<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.test.test2.model.MemberDAO" %>
<%@ page import="com.test.test2.model.MemberDTO" %>
<%@ page import="com.test.test2.model.SalesDTO" %>
<%@ page import="java.util.List" %>

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 회원매출조회</h2>
	<div id="findAll">
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
		<%
			MemberDAO memberDAO = new MemberDAO();
			List<MemberDTO> mList = memberDAO.salesMember();
			for (MemberDTO m : mList){
		%>
			<tr>
				<td><%=m.getCustno()%></td>
				<td><%=m.getCustname() %></td>
				<td><%=m.getGrade() %></td>
				<td><%=m.getSales() %></td>
			</tr>
		<%
			}
		%>
			
		</table>
	
	</div>
</body>
</html>