<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<!-- <h1>Hello world! ㅋㅋ</h1> -->

	<img src="${path}/resources/template/images/main.jpg" style="width:100% ; height: auto;"> 
	
	<script>
	
	var uniqId = '${loginVO.uniqId}';
	console.log(uniqId)
	if (uniqId != '' ) {
		console.log("$$$$$")
		location.href = "tiles/brd/dashBoard";
	}
	
	</script>
</body>
</html>
