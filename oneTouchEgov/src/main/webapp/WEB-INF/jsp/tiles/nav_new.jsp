<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<nav class="sidebar sidebar-offcanvas" id="sidebar">

<ul id="nav" class="nav">

	

	
<c:forEach var="list" items="${role.data.contents}">
	<c:if test="${list.menuNo != '0'}">
		<c:set var="i" value="${i + 1 }" />
		
		<%-- <p>${i}</p> --%>
		
		
		<c:if test="${list.chkUrl =='dir' && i != 1}">
			</ul></div></li>
		</c:if>
		<c:if test="${list.chkUrl == 'dir'}">
			<c:if test="${list.menuNo == '1000000'}">
				<li class="nav-item">
				<a class="nav-link" data-toggle="collapse" href="#ui-usermng" aria-expanded="false" aria-controls="ui-usermng">
					<i class="icon-head menu-icon"></i>
					<span class="menu-title">${list.menuNm}</span>
					<i class="menu-arrow"></i>
				</a>
				<div class="collapse" id="ui-usermng">
					<ul class="nav flex-column sub-menu">
			</c:if>
			<c:if test="${list.menuNo == '2000000'}">
				<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#ui-scrt" aria-expanded="false" aria-controls="ui-scrt">
		              <i class="icon-head menu-icon"></i>
		              <span class="menu-title">${list.menuNm}</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="ui-scrt">
		              <ul class="nav flex-column sub-menu">
			</c:if>
			<c:if test="${list.menuNo == '3000000'}">
				<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#ui-system" aria-expanded="false" aria-controls="ui-system">
		              <i class="icon-ban menu-icon"></i>
		              <span class="menu-title">${list.menuNm}</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="ui-system">
		              <ul class="nav flex-column sub-menu">
			</c:if>
			<c:if test="${list.menuNo == '4000000'}">
				<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#ui-usersupport" aria-expanded="false" aria-controls="ui-usersupport">
		              <i class="icon-ban menu-icon"></i>
		              <span class="menu-title">${list.menuNm}</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="ui-usersupport">
		              <ul class="nav flex-column sub-menu">
			</c:if>
			<c:if test="${list.menuNo == '6000000'}">
				<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
		              <i class="icon-layout menu-icon"></i>
		              <span class="menu-title">${list.menuNm}</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="ui-basic">
		              <ul class="nav flex-column sub-menu">
			</c:if>
			<c:if test="${list.menuNo == '7000000'}">
				<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
		              <i class="icon-columns menu-icon"></i>
		              <span class="menu-title">${list.menuNm}</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="form-elements">
		              <ul class="nav flex-column sub-menu">
			</c:if>
			<c:if test="${list.menuNo == '8000000'}">
				<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
		              <i class="icon-bar-graph menu-icon"></i>
		              <span class="menu-title">${list.menuNm}</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="charts">
		              <ul class="nav flex-column sub-menu">
			</c:if>
			<c:if test="${list.menuNo == '9000000'}">
				<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
		              <i class="icon-grid menu-icon"></i>
		              <span class="menu-title">${list.menuNm}</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="tables">
		              <ul class="nav flex-column sub-menu">
			</c:if>
			
		</c:if>
		<c:if test="${list.chkUrl != 'dir' && list.chkUrl != ''}">
			<li class="nav-item"> <a class="nav-link" href="${path}${list.chkUrl}">${list.menuNm}</a></li>
		</c:if>
	</c:if> 
	
</c:forEach>

</ul></div></li>

</ul>
</nav>
<script>



</script>