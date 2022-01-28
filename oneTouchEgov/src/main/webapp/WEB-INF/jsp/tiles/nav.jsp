<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav"> 
          <%-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="icon-contract menu-icon"></i>
              <span class="menu-title">egov</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/uat/uia/egovLoginUsr.do">로그인</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/uat/uap/selectLoginPolicyList.do">로그정책관리</a></li>
              </ul>
            </div>
          </li> --%>
          
          <%-- <c:if test="${loginVO != null}">
			 <c:if test='${loginVO.uniqId != null}'>
			 	 <script>
				 	$.ajax({
						url : 'selectRole',
						method : 'POST',
						async : false,
						data : 'uniqId=${loginVO.uniqId}',
						dataType:'application/html',
						success : function(result){
							//window.alert(result);
						}
					})
			 	 </script>
			 </c:if>
		  </c:if>   --%>
		  
		  <c:if test="${role != null }">
		  	<script>
		  		console.log("-_-bbbbbbb");
		  		//console.log(${role})
		  	</script>
		  	
		  	<c:if test="${role == 'ADMIN' }">
		  		<script>
			  		console.log("제발ㅠㅠ");
			  	</script>
			  	
			  	<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#ui-usermng" aria-expanded="false" aria-controls="ui-usermng">
		              <i class="icon-head menu-icon"></i>
		              <span class="menu-title">통합인증</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="ui-usermng">
		              <ul class="nav flex-column sub-menu">
		                <li class="nav-item"> <a class="nav-link" href="${path}/uat/uap/selectLoginPolicyList.do">로그정책관리</a></li>
		              </ul>
		            </div>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#ui-scrt" aria-expanded="false" aria-controls="ui-scrt">
		              <i class="icon-head menu-icon"></i>
		              <span class="menu-title">보안</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="ui-scrt">
		              <ul class="nav flex-column sub-menu">
		                <li class="nav-item"> <a class="nav-link" href="${path}/sec/ram/EgovAuthorList.do">권한관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sec/rgm/EgovAuthorGroupList.do">권한그룹관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sec/gmt/EgovGroupList.do">그룹관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sec/rmt/EgovRoleList.do">롤관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sec/drm/EgovDeptAuthorList.do">부서권한관리</a></li>
		              </ul>
		            </div>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#ui-system" aria-expanded="false" aria-controls="ui-system">
		              <i class="icon-ban menu-icon"></i>
		              <span class="menu-title">시스템관리</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="ui-system">
		              <ul class="nav flex-column sub-menu">
		                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/mpm/EgovMenuListSelect.do">메뉴리스트관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/mpm/EgovMenuManageSelect.do">메뉴관리리스트</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/mcm/EgovMenuCreatManageSelect.do">메뉴생성관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/stm/EgovSiteMapng.do">메뉴생성관리사이트맵</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/stm/EgovSiteMapng.do">사이트맵</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/bmm/selectBkmkMenuManageList.do">바로가기메뉴관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/sym/prm/EgovProgramListManageSelect.do">프로그램관리</a></li>
		              </ul>
		            </div>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#ui-usersupport" aria-expanded="false" aria-controls="ui-usersupport">
		              <i class="icon-ban menu-icon"></i>
		              <span class="menu-title">사용자지원</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="ui-usersupport">
		              <ul class="nav flex-column sub-menu">
		                <li class="nav-item"> <a class="nav-link" href="${path}/uss/umt/EgovEntrprsMberManage.do">기업회원관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/uss/umt/EgovUserManage.do">업무사용자관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/uss/umt/dpt/selectDeptManageListView.do">부서관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/uss/umt/EgovMberManage.do">일반회원관리</a></li>
		              </ul>
		            </div>
		          </li>
		  	</c:if>
		  	
		  	<c:if test="${role == 'ADMIN' || role =='PDTADM' || role =='MTRADM' || role =='FCTADM'}">
		  		<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
		              <i class="icon-layout menu-icon"></i>
		              <span class="menu-title">공통 관리</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="ui-basic">
		              <ul class="nav flex-column sub-menu">
		                <li class="nav-item"> <a class="nav-link" href="${path}/adm/BasList">공통코드관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/adm/BomList">제품Bom관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/adm/mngList">공정관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/adm/FlwList">공정흐름관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/adm/FltList">불량코드관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/adm/mtrList">자재정보관리</a></li>
		              </ul>
		            </div>
		          </li>
		  	</c:if>
		  	
		  	<c:if test="${role == 'PDT' || role =='PDTADM' || role == 'ADMIN'}">
		  		<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
		              <i class="icon-columns menu-icon"></i>
		              <span class="menu-title">생산 관리</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="form-elements">
		              <ul class="nav flex-column sub-menu">
		              	<li class="nav-item"><a class="nav-link" href="${path}/pdt/ordList">주문서목록</a></li>
		                <li class="nav-item"><a class="nav-link" href="${path}/pdt/PlanList">생산계획관리</a></li>
		                <li class="nav-item"><a class="nav-link" href="${path}/pdt/planListView">생산계획조회</a></li>
		                <li class="nav-item"><a class="nav-link" href="${path}/pdt/WorkList">생산지시관리</a></li>
		                <li class="nav-item"><a class="nav-link" href="${path}/pdt/WorkListView">생산지시조회</a></li>
		                <li class="nav-item"><a class="nav-link" href="${path}/pdt/prdPrcList">생산공정관리</a></li>
		                <li class="nav-item"><a class="nav-link" href="${path}/pdt/movingPrc">공정이동표</a></li>
		              </ul>
		            </div>
		          </li>
		  	</c:if>
		  	
		  	<c:if test="${role == 'MTR' || role =='MTRADM' || role == 'ADMIN'}">
		  		<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
		              <i class="icon-bar-graph menu-icon"></i>
		              <span class="menu-title">자재 관리</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="charts">
		              <ul class="nav flex-column sub-menu">
		                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/inForm">입고자재관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/inList">입고자재조회</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/outList">출고자재조회</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/rtnForm">반품자재관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/rtnList">반품자재조회</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/calForm">재고조정관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/calList">재고조정조회</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/stckList">재고조회</a></li>
		              </ul>
		            </div>
		          </li>
		  	</c:if>
		  	
		  	<c:if test="${role == 'FCT' || role =='FCTADM' || role == 'ADMIN'}">
		  		<li class="nav-item">
		            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
		              <i class="icon-grid menu-icon"></i>
		              <span class="menu-title">설비 관리</span>
		              <i class="menu-arrow"></i>
		            </a>
		            <div class="collapse" id="tables">
		              <ul class="nav flex-column sub-menu">
		            	<li class="nav-item"> <a class="nav-link" href="${path}/fct/fctInfoIns">설비등록</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/fct/fctInfoSel">설비조회</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/fct/fctFix">수리관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/fct/fctProd">점검관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/fct/fctDwtmIns">비동기관리</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/fct/UploadFile">업로드 테스트</a></li>
		                <li class="nav-item"> <a class="nav-link" href="${path}/fct/UploadAjax">아작스 업로드 테스트</a></li>
		              </ul>
		            </div>
		          </li>
		  	</c:if>
		  	
		  </c:if>
		  
		  <c:if test="${rtn != '' }">
		  	<script>
		  		console.log("-_-+++++++");		  		
		  	</script>
		  	
		  	<%-- <c:set var = "menulist" value="${rtn}" />
		  	
		  	<c:if test="${fn:contains (menulist, 'adm')}">
		  		console.log("^__^;");
		  	</c:if>  --%>
		  	
		  </c:if>
		  	
          
          <%-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-usermng" aria-expanded="false" aria-controls="ui-usermng">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">통합인증</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-usermng">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/uat/uap/selectLoginPolicyList.do">로그정책관리</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-scrt" aria-expanded="false" aria-controls="ui-scrt">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">보안</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-scrt">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/sec/ram/EgovAuthorList.do">권한관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sec/rgm/EgovAuthorGroupList.do">권한그룹관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sec/gmt/EgovGroupList.do">그룹관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sec/rmt/EgovRoleList.do">롤관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sec/drm/EgovDeptAuthorList.do">부서권한관리</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-system" aria-expanded="false" aria-controls="ui-system">
              <i class="icon-ban menu-icon"></i>
              <span class="menu-title">시스템관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-system">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/mpm/EgovMenuListSelect.do">메뉴리스트관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/mpm/EgovMenuManageSelect.do">메뉴관리리스트</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/mcm/EgovMenuCreatManageSelect.do">메뉴생성관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/stm/EgovSiteMapng.do">메뉴생성관리사이트맵</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/stm/EgovSiteMapng.do">사이트맵</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sym/mnu/bmm/selectBkmkMenuManageList.do">바로가기메뉴관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/sym/prm/EgovProgramListManageSelect.do">프로그램관리</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-usersupport" aria-expanded="false" aria-controls="ui-usersupport">
              <i class="icon-ban menu-icon"></i>
              <span class="menu-title">사용자지원</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-usersupport">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/uss/umt/EgovEntrprsMberManage.do">기업회원관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/uss/umt/EgovUserManage.do">업무사용자관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/uss/umt/dpt/selectDeptManageListView.do">부서관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/uss/umt/EgovMberManage.do">일반회원관리</a></li>
              </ul>
            </div>
          </li> --%>
          <%-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">공통 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/adm/BasList">공통코드관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/adm/BomList">제품Bom관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/adm/mngList">공정관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/adm/FlwList">공정흐름관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/adm/FltList">불량코드관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/adm/mtrList">자재정보관리</a></li>
              </ul>
            </div>
          </li> --%>
          <%-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">생산 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
              	<li class="nav-item"><a class="nav-link" href="${path}/pdt/ordList">주문서목록</a></li>
                <li class="nav-item"><a class="nav-link" href="${path}/pdt/PlanList">생산계획관리</a></li>
                <li class="nav-item"><a class="nav-link" href="${path}/pdt/planListView">생산계획조회</a></li>
                <li class="nav-item"><a class="nav-link" href="${path}/pdt/WorkList">생산지시관리</a></li>
                <li class="nav-item"><a class="nav-link" href="${path}/pdt/WorkListView">생산지시조회</a></li>
                <li class="nav-item"><a class="nav-link" href="${path}/pdt/prdPrcList">생산공정관리</a></li>
                <li class="nav-item"><a class="nav-link" href="${path}/pdt/movingPrc">공정이동표</a></li>
              </ul>
            </div>
          </li> --%>
          <%-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">자재 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/inForm">입고자재관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/inList">입고자재조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/outList">출고자재조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/rtnForm">반품자재관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/rtnList">반품자재조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/calForm">재고조정관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/calList">재고조정조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/mtr/stckList">재고조회</a></li>
              </ul>
            </div>
          </li> --%>
          <%-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">설비 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
            	<li class="nav-item"> <a class="nav-link" href="${path}/fct/fctInfoIns">설비등록</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/fct/fctInfoSel">설비조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/fct/fctFix">수리관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/fct/fctProd">점검관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/fct/fctDwtmIns">비동기관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/fct/UploadFile">업로드 테스트</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path}/fct/UploadAjax">아작스 업로드 테스트</a></li>
              </ul>
            </div>
          </li> --%>
          
          <!-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">User Pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
              <i class="icon-ban menu-icon"></i>
              <span class="menu-title">Error pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="error">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="pages/documentation/documentation.html">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">Documentation</span>
            </a>
          </li> -->
        </ul>
      </nav>