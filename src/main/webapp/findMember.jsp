<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.test2.model.MemberDAO" %>
<%@ page import="com.test.test2.model.MemberDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table,tr,th,td {
		border : solid gray 1px;
	}	
	table {
		margin : auto;
	}
</style>
</head>
<body>
	<h2>회원목록조회/수정</h2><br>
	
	<div id="findAll">
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
		<%
			MemberDAO memberDAO = new MemberDAO();
			List<MemberDTO> mList = memberDAO.findMember();
			for (MemberDTO m : mList){
		%>
			<tr>
				<td><a href="updateMemberForm.jsp?custno=<%=m.getCustno()%>"><%=m.getCustno()%></a></td>
				<td><%=m.getCustname() %></td>
				<td><%=m.getPhone() %></td>
				<td><%=m.getAddress() %></td>
				<td><%=m.getJoindate() %></td>
				<td><%=m.getGrade() %></td>
				<td><%=m.getCity() %></td>
			</tr>
		<%
			}
		%>
			
		</table>
	
	</div>
</body>
</html>