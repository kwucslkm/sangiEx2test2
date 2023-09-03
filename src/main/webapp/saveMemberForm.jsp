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
	<%
		MemberDAO memberDAO = new MemberDAO();
		int lastCustno = memberDAO.findLastCustno();
	%>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
	<div id = "section">
		<h2>홈쇼핑 회원 등록</h2><br>
		
		<form action = "saveMember.jsp" name = "saveMemberForm">
			<table>
			<tr>
				<th>회원번호(자동발생)</th> <td><input type="text" name="custno" value="<%=lastCustno%>"></td>
			</tr>
			<tr>
				<th>회원성명</th><td> <input type ="text" name="custname" value=""></td>
			</tr>
			<tr>
				<th>회원전화</th><td> <input type ="text" name="phone" value=""></td>
			</tr>
			<tr>
				<th>회원주소</th><td> <input type ="text" name="address" value=""></td>
			</tr>
			<tr>
				<th>가입일자</th><td> <input type ="text" name="joindate" value=""></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th><td> <input type ="text" name="grade" value=""></td>
			</tr>
			<tr>
				<th>도시코드</th><td> <input type ="text" name="city" value=""></td>
			</tr>
			<tr>
				<th>
					<input type="submit" value="등록">
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