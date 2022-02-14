<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page session="false"%>
<html>

<style>
.image{
	height: 94vh !important;
    width: 210vh !important; 
    margin-left: -9% !important; 
   	/*  width: 130vh !important; */
    /* margin-left: 21% !important; */
}
</style>

<head>
<title>Home</title>
</head>
<body>
	<!-- <h1>Hello world! ㅋㅋ</h1> -->
	
	<img src="${path}/resources/template/images/main2.jpg" class="image"> 
	
	<script>
	
	var uniqId = '${loginVO.uniqId}';
	console.log(uniqId)
	if (uniqId != '' ) {
		console.log("$$$$$")
		location.href = "/brd/dashBoard";
	}
	
	</script>
</body>
</html>
