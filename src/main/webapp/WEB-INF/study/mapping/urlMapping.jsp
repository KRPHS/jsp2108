<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>urlMapping.jsp</title>
  <%@ include file="../../../include/bs4.jsp" %>
</head>
<body>
  <%@ include file="../../../include/header_home.jsp" %>
  <%@ include file="../../../include/nav.jsp" %>
  
  <p><br></p>
  <div class="container">
		<h2>URL Mapping 연습</h2>
		<hr>
		<br>
		<p><a href="<%=request.getContextPath() %>/URLMappingList" class="form-control btn btn-info">Directory(1개작업 유용 mapping패키지) Pattern으로 정보리스트 이동</a></p>
		<hr>
		<p><a href="<%=request.getContextPath() %>/urlMappingList.um" class="form-control btn btn-info">Extension(다작업 유용 mapping2패키지) Pattern으로 정보리스트 이동</a></p>
		<p><a href="<%=request.getContextPath() %>/urlMappingInput.um" class="form-control btn btn-info">Extension Pattern으로 정보등록 이동</a></p>
		<p><a href="<%=request.getContextPath() %>/" class="form-control btn btn-info">홈으로</a></p>
  </div>
  <br>
  
  <%@ include file="../../../include/footer.jsp" %>
</body>
</html>