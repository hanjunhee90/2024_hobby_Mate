<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 

    <h1>ChatGPT Response</h1>
    <p>${response}</p>
    <a href="${pageContext.request.contextPath}/chat">Ask again</a>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>