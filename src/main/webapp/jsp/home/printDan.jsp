<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String inputedDan = request.getParameter("dan");

if (inputedDan == null) {
	inputedDan = "1";
}
String inputedLimit = request.getParameter("limit");

if (inputedLimit == null) {
	inputedLimit = "9";
}
int dan = Integer.parseInt(inputedDan);
int limit = Integer.parseInt(inputedLimit);
String color = request.getParameter("color");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력</title>
</head>
<body>
	<div style="color:<%=color%>;">== <%=dan %>단 ==</div>
	
	<% for (int i = 1; i <= limit; i++) { %>
		<div style="color:<%=color%>;"><%=dan %> * <%=i %> = <%=dan * i %></div>
	<% } %>
</body>
</html>