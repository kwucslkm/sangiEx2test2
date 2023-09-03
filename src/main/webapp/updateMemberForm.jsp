<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.test2.model.MemberDAO" %>
<%@ page import="com.test.test2.model.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	* {
		margin : 0;
		padding : 0;
	}
	#section {
		text-align : center;
		background-color : rightgray;
		margin : auto;
		
	}
	table{
		margin : auto;
	}
	table, tr, th, td {
		text-align : center;
		border : 1px gray solid;
		border-collapse : collapse;
	}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String custno = request.getParameter("custno");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.findByCustno(custno);
	%>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
	<div id = "section">
		<h2>홈쇼핑 회원 정보 수정</h2><br>
		
		<form action = "updateMember.jsp" name = "updateMemberForm">
			<table>
			<tr>
				<th>회원번호</th> <td><input type="text" name="custno" value="<%=memberDTO.getCustno()%>"></td>
			</tr>
			<tr>
				<th>회원성명</th><td> <input type ="text" name="custname" value="<%=memberDTO.getCustname()%>"></td>
			</tr>
			<tr>
				<th>회원전화</th><td> <input type ="text" name="phone" value="<%=memberDTO.getPhone()%>"></td>
			</tr>
			<tr>
				<th>회원주소</th><td> <input type ="text" name="address" value="<%=memberDTO.getAddress()%>"></td>
			</tr>
			<tr>
				<th>가입일자</th><td> <input type ="text" name="joindate" value="<%=memberDTO.getJoindate()%>"></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th><td> <input type ="text" name="grade" value="<%=memberDTO.getGrade()%>"></td>
			</tr>
			<tr>
				<th>도시코드</th><td> <input type ="text" name="city" value="<%=memberDTO.getCity()%>"></td>
			</tr>
			<tr>
				<th>
					<input type="submit" value="수정">
				</th>
				<td>
					<input type="button" value="조회" onclick="location.href='findMember.jsp'">
				</td>
			</tr>
				
			</table>
		
		</form>
		
	</div>

<%@include file="footer.jsp" %>
</body>
</html>