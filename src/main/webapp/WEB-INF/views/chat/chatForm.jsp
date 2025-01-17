<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 

<form action="${pageContext.request.contextPath}/chat" method="POST">
	<label for="prompt">Ask ChatGPT:</label>
	<input type="text" id="prompt" name="prompt" required>
	<button type="submit">Submit</button>
</form>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>