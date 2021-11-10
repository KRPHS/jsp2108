<%@page import="java.util.Date"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Date date = new Date();
	long time = date.getTime();
	
	//String fileName = time + ".txt";
	String fileName = new Date().getTime() + ".txt";
	
	PrintWriter writer = null;
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>writeFormOk.jsp</title>
  <%@ include file="../include/bs4.jsp" %>
</head>
<body>
  
  <p><br></p>
  <div class="container">
		<h2>저장된 파일의 내용보기</h2>
<%
	try {
		String filePath = application.getRealPath("/textFile/"+fileName);
		writer = new PrintWriter(filePath);
		writer.println("제목 : " + title);
		writer.println("내용 : ================================= \n" + content);
		out.println("<p>'"+filePath+"'저장되었습니다</p><br>");
		out.println("<p><a href='writeForm.jsp'>돌아가기</a></p>");
	} catch (IOException e) {
		out.println("파일 저장중 오류!");
		out.println("<p><a href='writeForm.jsp' class='btn btn-secondary'>돌아가기</a></p>");
	} finally {
		writer.close();
	}
%>
  </div>
  <br>
  
</body>
</html>