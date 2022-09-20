<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
boolean isLogined = (boolean) request.getAttribute("isLogined");
int loginedMemberId = (int) request.getAttribute("loginedMemberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h1>메인 페이지</h1>
	
	<div>
		<button><a href="../article/list">게시물 리스트</a></button>
		<button><a href="../member/join">회원 가입</a></button>
	
	<% if(isLogined) { %>
		<%=loginedMemberId %>번 회원
		<button><a href="../member/doLogout">로그아웃</a></button>
	<%} %>
	<% if(!isLogined) { %>
		<button><a href="../member/login">로그인</a></button>
	<%} %>
	</div>
</body>
</html>