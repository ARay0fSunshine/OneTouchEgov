<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul id="nav" class="nav"></ul>
</nav>
      
<script>
 $(document).ready(function() {
	var uniqId = '${loginVO.uniqId}';
	var temp = location.href;
	
	if (temp.indexOf("localhost") >= 0) { 
		temp = temp.substring(0, 30);
	}else {
		temp = temp.substring(0, 25);
	}
	console.log(temp);
	$.ajax({
		//url: 'selectRole',
		url : temp + 'selectRole',
		type: 'POST',
		async : false,
		data: {
			'uniqId': uniqId
		},
		dataType: 'json',
		success: function(result) {
			console.log(result.data.contents);
			console.log(result.data.contents.length);
			
			var chk = 0;
			var str =  '';
			
			if (result.data.contents.length > 1) {
				str += '<li class="nav-item">'
	            str += '<a class="nav-link" href="${path}/brd/dashBoard">'
                str += '	<i class="bi bi-clipboard-data menu-icon"></i>'
            	str += '	<span class="menu-title">Dashboard</span>'
          		str += '</a>'
        		str += '</li>'
			}
				
			for (var i = 1; i < result.data.contents.length; i++) {
				if (i != 1 && result.data.contents[i].chkUrl == 'dir') {
					str += '</ul></div></li>'
				}
				if (result.data.contents[i].chkUrl == 'dir') {
					
					if (result.data.contents[i].menuNo == '1000000') {
						str += '<li class="nav-item">'
						str += '<a class="nav-link" data-toggle="collapse" href="#ui-usermng" aria-expanded="false" aria-controls="ui-usermng">'
						str += '  <i class="icon-contract menu-icon"></i>'
						str += '  <span class="menu-title">' + result.data.contents[i].menuNm + '</span>'
						str += '  <i class="menu-arrow"></i>'
						str += '</a>'
						str += '<div class="collapse" id="ui-usermng">'
						str += '  <ul class="nav flex-column sub-menu">'
					}else if (result.data.contents[i].menuNo == '2000000') {
						str += '<li class="nav-item">'
						str += '<a class="nav-link" data-toggle="collapse" href="#ui-scrt" aria-expanded="false" aria-controls="ui-scrt">'
						str += '  <i class="bi bi-lock-fill menu-icon"></i>'
						str += '  <span class="menu-title">' + result.data.contents[i].menuNm + '</span>'
						str += '  <i class="menu-arrow"></i>'
						str += '</a>'
						str += '<div class="collapse" id="ui-scrt">'
						str += '  <ul class="nav flex-column sub-menu">'
					}else if (result.data.contents[i].menuNo == '3000000') {
						str += '<li class="nav-item">'
						str += '<a class="nav-link" data-toggle="collapse" href="#ui-system" aria-expanded="false" aria-controls="ui-system">'
						str += '  <i class="bi bi-gear-wide menu-icon"></i>'
						str += '  <span class="menu-title">' + result.data.contents[i].menuNm + '</span>'
						str += '  <i class="menu-arrow"></i>'
						str += '</a>'
						str += '<div class="collapse" id="ui-system">'
						str += '  <ul class="nav flex-column sub-menu">'
					}else if (result.data.contents[i].menuNo == '4000000') {
						str += '<li class="nav-item">'
						str += '<a class="nav-link" data-toggle="collapse" href="#ui-usersupport" aria-expanded="false" aria-controls="ui-usersupport">'
						str += '  <i class="bi bi-person-bounding-box menu-icon"></i>'
						str += '  <span class="menu-title">' + result.data.contents[i].menuNm + '</span>'
						str += '  <i class="menu-arrow"></i>'
						str += '</a>'
						str += '<div class="collapse" id="ui-usersupport">'
						str += '  <ul class="nav flex-column sub-menu">'
					}else if (result.data.contents[i].menuNo == '6000000') {
						str += '<li class="nav-item">'
						str += '<a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">'
						str += '  <i class="bi bi-pencil-square menu-icon"></i>'
						str += '  <span class="menu-title">' + result.data.contents[i].menuNm + '</span>'
						str += '  <i class="menu-arrow"></i>'
						str += '</a>'
						str += '<div class="collapse" id="ui-basic">'
						str += '  <ul class="nav flex-column sub-menu">'
					}else if (result.data.contents[i].menuNo == '7000000') {
						str += '<li class="nav-item">'
						str += '<a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">'
						str += '  <i class="bi bi-speedometer menu-icon"></i>'
						str += '  <span class="menu-title">' + result.data.contents[i].menuNm + '</span>'
						str += '  <i class="menu-arrow"></i>'
						str += '</a>'
						str += '<div class="collapse" id="form-elements">'
						str += '  <ul class="nav flex-column sub-menu">'
					}else if (result.data.contents[i].menuNo == '8000000') {
						str += '<li class="nav-item">'
						str += '<a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">'
						str += '  <i class="bi bi-box-seam menu-icon"></i>' 
						str += '  <span class="menu-title">' + result.data.contents[i].menuNm + '</span>'
						str += '  <i class="menu-arrow"></i>'
						str += '</a>'
						str += '<div class="collapse" id="charts">'
						str += '  <ul class="nav flex-column sub-menu">'
					}else if (result.data.contents[i].menuNo == '9000000') {
						str += '<li class="nav-item">'
						str += '<a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">'
						str += '  <i class="bi bi-tools menu-icon"></i>'
						str += '  <span class="menu-title">' + result.data.contents[i].menuNm + '</span>'
						str += '  <i class="menu-arrow"></i>'
						str += '</a>'
						str += '<div class="collapse" id="tables">'
						str += '  <ul class="nav flex-column sub-menu">'
					}else if (result.data.contents[i].menuNo == '10000000') {
						chk = 1;
					}
				
				} else if (result.data.contents[i].chkUrl != '') {
					str += '<li class="nav-item"> <a class="nav-link" href="${path}' + result.data.contents[i].chkUrl + '">' + result.data.contents[i].menuNm + '</a></li>'
				}
			}
			
			str += '</ul></div></li>' 
			
			if (chk == 1) { 
				str += '<li class="nav-item">'
				str += '<a class="nav-link" href="${path}/sts/stsList">'
				str += '	<i class="icon-bar-graph menu-icon"></i>'
				str += '	<span class="menu-title">통계</span>'
				str += '</a>'
				str += '</li>'
			}
			
			$('#nav').append(str); 
			
		}
	});
}); 

</script>