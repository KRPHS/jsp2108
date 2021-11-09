<%@page import="guest.GuestVO"%>
<%@page import="java.util.List"%>
<%@page import="guest.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	GuestDAO dao = new GuestDAO();
	List<GuestVO> vos = dao.gList();
	GuestVO vo = new GuestVO();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>gList.jsp(방명록 리스트 수정)</title>
  <%@ include file="../include/bs4.jsp" %>
  <style>
  	th {
  		background-color: #ccc;
  	}
  </style>
</head>
<body>
  <%@ include file="../include/header_home.jsp" %>
  <%@ include file="../include/nav.jsp" %>
  
  <p><br></p>
  <div class="container">
  <table class="table table-borderless">
  	<tr><td colspan="2" style="text-align: center;"><h2>방 명 록 리 스 트</h2></td></tr>
  	<tr>
  		<td><a href="<%=request.getContextPath()%>/" class="btn btn-secondary">관리자</a></td>
  		<td style="text-align: right;"><a href="<%=request.getContextPath()%>/guest/gInput.jsp" class="btn btn-secondary">글쓰기</a></td>
  	</tr>
		
	</table>
		
<%
	for(int i = 0; i < vos.size(); i++) {
		vo = vos.get(i);
		
		String email = vo.getEmail();
		if(email.equals("") || email == null) email = "-없음-";
		String homepage = vo.getHomepage();
		if(homepage.equals("") || homepage == null) homepage = "-없음-";
		
		String content = vo.getContent().replace("\n", "<br>");
%>
		
		<table class="table table-borderless">
			<tr>
				<td>
					방문번호 : <%=vo.getIdx() %>
				</td>
				<td style="text-align: right;">
					방문IP : <%=vo.getHostIp() %>
				</td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th>성명</th><td><%=vo.getName() %></td>
				<th>방문일자</th><td><%=vo.getvDate() %></td>
			</tr>
			<tr>
				<th>전자우편</th><td colspan="3"><%=email %></td>
			</tr>
			<tr>
				<th>홈페이지</th><td colspan="3"><a href="<%=homepage %>" target="_blank"><%=homepage %></a></td>
			</tr>
			<tr>
				<th>글 내용</th><td colspan="3"><%=content %></td>
			</tr>
		</table>
<% } %>		
  </div>
  <br>
  
  <%@ include file="../include/footer.jsp" %>
</body>
</html>