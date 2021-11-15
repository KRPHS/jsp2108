<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/sCheck.jsp" %>
<%
	
	//int point = (int) session.getAttribute("sPoint");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memMain.jsp</title>
<%@ include file="../../include/bs4.jsp"%>
</head>
<body>
	<%@ include file="../../include/header_guest.jsp"%>
	<%@ include file="../../include/nav.jsp"%>
	<p><br></p>
	
	<div class="container">
		<h2>정규회원방</h2>
		<hr>
		<p><font color="blue"> ${sNickName} </font>님 로그인 중이십니다.</p>
		<p>현재 ${strLevel }이십니다.</p>
		<p>최종접속일 : ${sLastDate }</p>
		<!-- <p>소지중인 포인트 </p> -->
		<hr>
	</div>
	<br>
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>