<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품공정흐름관리</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="${path}/resources/js/modal.js"></script>
<script src="${path}/resources/js/grid-common.js"></script>

<style>
.hr4{
	margin-top: 1.5rem !important;
}
.labeltext{
	width: 80px !important;
}
.colline1{
	margin-left: 158px;
	width: 80px !important;
}
.colline2{
	margin-left: 100px;
	width: 80px !important;
}
.bascard1{
	height: 230px;
}
.inline{
	display: inline-block;
	margin-left: 0px !important;
	margin-top: 10px !important;
	margin-botton: 0px !important;
}
.rowdiv{
	margin-bottom: 15px !important;
}
.inputtext{
	margin-left: 20px;
}
.row1{
	/* margin-bottom: -20px !important; */
	vertical-aline: middle !important;
}
.form-check .form-check-label input[type="checkbox"] + .input-helper:before, .form-check .form-check-label input[type="checkbox"] + .input-helper:after{
	top: 12px;
}
.basCdColor{
	background-color: pink;
}
</style>

</head>
<body>

<div class="content-wrapper">
	<div class="row">
		<div class="col-md-12 grid-margin">
			<div class="row">
				<div class="col-12 col-xl-8 mb-4 mb-xl-0">
					<h3 class="font-weight-bold page-title">제품공정흐름관리</h3>
				</div>
			</div>
		</div>
	</div>
	
	<div class="flex row">
		<div class = "col-4">
			<h4 class="gridtitle">✔제품목록</h4>
			<!-- <span class="floatright">
				<button type="button" id="btnAdd" class="btn btn-main newalign2">ğС</button>
			</span>
			<br><br> -->
			<hr class="hr4">
			<div id="grid1"></div>
		</div>
		
		<div class= "col-8">
			<h4 class="gridtitle">✔제품상세정보</h4>
			<span class="floatright">
				<button type="button" id="btnReset"  class="btn btn-main newalign2">초기화</button>
				<button type="button" id="btnAddPrd" class="btn btn-primary newalign2">등록</button>
				<button type="button" id="btnDelPrd" class="btn btn-main newalign2">삭제</button>
				<button type="button" id="btnEditPrd" class="btn btn-primary newalign2">수정</button>
			</span>
			<br>
			<hr class="hr4">
			<div class="row">
				<div class="col-md-12 grid-margin stretch-card">
					<div class="card bascard">
						<div class="card-body bascard1">
							<!-- <h4 class="card-title">fǰܼܳdڸ</h4> -->
							<form id="flwFrm" name="flwFrm" method="post" onsubmit="return false">
								<div class="rowdiv">
									<label class="labeltext">제품코드&nbsp;</label>
									<input id="prdCd" name="prdCd" class="inputtext" onkeyup="enterPrdCd()">
									<label class="labeltext colline2">제품명&nbsp;</label>
									<input id="prdNm" name="prdNm" class="inputtext">
								</div>
								
								<div class="rowdiv">
									<label class="labeltext">제품규격&nbsp;</label>
									<select id="prdStdNm" name="prdStd" class="inputtext"></select>
									<!-- <button type="button" id="btnprdStd" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button> -->
									<label class="labeltext colline2">관리단위&nbsp;</label>
									<select id="mngUnitNm" name="mngUnit" class="inputtext"></select>
									<!-- <button type="button" id="btnmngUnit" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button> -->
								</div>
								
								<div class="rowdiv" style="margin-top: -16px;">
									<label class="labeltext">제품구분&nbsp;</label>
									<select id="prdSectNm" name="prdSect" class="inputtext"></select>
									<!-- <button type="button" id="btnmngUnit" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button> -->
									
									<label class="labeltext colline2">사용여부</label>&emsp;&nbsp;
									<span class="form-check form-check-flat form-check-primary inline">
										<label class="form-check-label chkboxalign">
											<!-- 사용여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
											<input id="useYn" name="useYn" type="checkbox" class="form-check-input" readonly>
										</label>
									</span>
								</div>
								
								<div class="rowdiv">
									<label class="labeltext">공정라인&nbsp;</label>
									<input id="ableLineNo" name="ableLineNo" style="width: 610px;" class="inputtext">
									
									<!-- <input type="hidden" id="prdSect" name="prdSect">
									<input type="hidden" id="mngUnit" name="mngUnit">
									<input type="hidden" id="prdStd" name="prdStd"> -->
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
			<h4 class="gridtitle">✔공정흐름</h4>
			<span class="floatright">
				<!-- <button type="button" id="btnFlw" class="btn btn-main newalign2">조회</button> -->
				<!-- <button type="button" id="btnAdd" class="btn btn-main newalign2">추가</button>
				<button type="button" id="btnDel" class="btn btn-main newalign2">삭제</button> -->
				<button type="button" id="btnSave" class="btn btn-primary newalign2">저장</button>
			</span>
			
			<br>
			<hr class="hr4">
			<div id="grid2"></div>
			
			<div id="dialog-form" title="title"></div>
		</div>
	</div>
</div>



<!-- <br>
<h3>[제품공정흐름관리]</h3>
<hr>
<div class="flex row">
<div class = "col-4">
	<h4>✔제품목록</h4>
	<div align="right">
		<hr>
	</div>
	<div id="grid1"></div>
	<br>
</div>
<div class= "col-8">
	<h4>✔제품상세정보</h4>
	<div align="right" style="margin-right: 3%;">
		<button type="button" id="btnReset">초기화</button>
		<button type="button" id="btnAddPrd">등록</button>
		<button id="btnDelPrd" type="button">삭제</button>
		<button type="button" id="btnEditPrd">수정</button><hr>
	</div>
	<form id="flwFrm" name="flwFrm" method="post" onsubmit="return false">
		<label>제품코드&nbsp;</label><input id="prdCd" name="prdCd" onkeyup="enterPrdCd()"><br>
		<label>제품명&emsp;&nbsp;</label><input id="prdNm" name="prdNm"><br>
		<label>제품규격&nbsp;</label><select id="prdStdNm" name="prdStd"></select><br>
			<button type="button" id="btnprdStd">🔍</button>
		<label>관리단위&nbsp;</label><select id="mngUnitNm" name="mngUnit"></select><br>
			<button type="button" id="btnmngUnit">🔍</button>
		<label>제품구분&nbsp;</label><select id="prdSectNm" name="prdSect"></select><br>
			<button type="button" id="btnprdSect">🔍</button>
		<input type="hidden" id="prdSect" name="prdSect">
		<input type="hidden" id="mngUnit" name="mngUnit">
		<input type="hidden" id="prdStd" name="prdStd">
		<label>공정라인&nbsp;</label><input id="ableLineNo" name="ableLineNo" style="width: 500px;"><br>
		<label>사용여부&nbsp;</label><input id="useYn" name="useYn" type="checkbox" style="width: 20px;">
	</form>
	<div align="right" style="margin-right: 3%;">
	<hr>
	<button id="btnFlw" type="button">조회</button>
	<button id="btnAdd" type="button">추가</button>
	<button id="btnDel" type="button">삭제</button>
	<button id="btnSave" type="button">저장</button>
	</div>
	<h4>✔공정흐름</h4><br>
	<div id="grid2"></div>
	<div id="dialog-form" title="title"></div>
</div>
</div> -->
<script type="text/javascript">
	//변수선언----------------------------------------
	let prdCode1;
	let prdCode2;
	let prdCodeVal;
	let rowk;
	let PrdDtl;
	let flwCnt;
	let lineSplit =[];
	let modifyList = [];
	let grid2GetDataDel;
	let grid2GetDataIns;
	//변수선언 끝-------------------------------------
	
	//기본세팅---------------------------------------
	
		//수정,삭제버튼 막아놓기
		document.getElementById('btnEditPrd').setAttribute('disabled', true);
		document.getElementById('btnDelPrd').setAttribute('disabled', true);
	
	//기본세팅 끝-------------------------------------	

	//그리드컬럼 선언----------------------------------
	const columns1 = [{
		
			header : '제품코드',
			name : 'prdCd',
			sortable : true //정렬
		},
		{
			header : '제품명',
			name : 'prdNm',
			sortable : true
		}];
	
	const columns2 = [{
		
		header : '공정순서',
		name : 'prcSeq',
		sortable : true,
		editor: 'text',
		align: 'center'
	},
	{
		header : '공정명',
		name : 'prcNm'
	},
	{
		header : '작업설명',
		name : 'workCmt',
		editor : 'text'
	},
	{
		header : '기준부하율',
		name : 'stdLoad',
		editor : 'text',
		align: 'right',
	},
	{
		header : '단가',
		name : 'unitCost',
		editor : 'text',
		align: 'right'
	},
	{
		header : 'LEAD타임',
		name : 'leadTime',
		editor : 'text',
		align: 'right'
	},
	{
		header : '제품코드',
		name : 'prdCd',
		hidden : true
	},
	{
		header : '공정코드',
		name : 'prcCd',
		hidden : true
	}];
	//그리드컬럼 선언 끝--------------------------------

	//셀렉트 옵션 채우기--------------------------------
	
		//제품규격 상세코드에서 받아오기
		$.ajax({
			url: './prdSizeList',
			dataType:'json',
			async : false
		}).done(function(datas){
			for(data of datas) {
				$('#prdStdNm').append("<option value="+data.prdStd+">"+data.prdStdNm+"</option>")
				//페이지 로드할때 셀렉트 모두 빈칸으로 만들기
				document.getElementById('prdStdNm').value = '';
			}
		});
		
		//단위구분 상세코드에서 받아오기
		$.ajax({
			url: './flwUnitList',
			dataType:'json',
			async : false
		}).done(function(datas){
			for(data of datas) {
				$('#mngUnitNm').append("<option value="+data.mngUnit+">"+data.mngUnitNm+"</option>")
				//페이지 로드할때 셀렉트 모두 빈칸으로 만들기
				document.getElementById('mngUnitNm').value = '';
			}
		});
		
		//제품구분 상세코드에서 받아오기
		$.ajax({
			url: './prdSectList',
			dataType:'json',
			async : false
		}).done(function(datas){
			for(data of datas) {
				$('#prdSectNm').append("<option value="+data.prdSect+">"+data.prdSectNm+"</option>")
				//페이지 로드할때 셀렉트 모두 빈칸으로 만들기
				document.getElementById('prdSectNm').value = '';
			}
		});
		
	//셀렉트 옵션 채우기 끝------------------------------
	
	
	//dataSource 선언-------------------------------
	var dataSource1 = {
			api: {
				readData: {
					url:'./admPrdList',
					method: 'GET'
				},
				modifyData: { 
					url: './prdModifyData', 
					method: 'POST'}
			},
			contentType: 'application/json'
	};
	
	var dataSource2 = {
			api: {
				readData:{
					url:'./admFlwList',
					method:'GET',
				},
				modifyData: { 
					url: './flwModifyData', 
					method: 'POST'}
			},
			contentType: 'application/json',
			initialRequest: false
	}
	//dataSource 선언 끝-----------------------------
	
	//그리드 그리기------------------------------------
	const grid1 = new Grid({
		el: document.getElementById('grid1'),
		data: dataSource1,
		columns: columns1,
		bodyHeight: 647,
		minBodyHeight: 647
	});
	
	const grid2 = new Grid({
		el: document.getElementById('grid2'),
		data: dataSource2,
		columns: columns2,
		bodyHeight: 315,
		minBodyHeight: 315
	});
	//그리드 그리기 끝----------------------------------
	
	//제품 기능---------------------------------------
		//제품명 클릭하면 제품상세정보 받아옴
		grid1.on("click", (ev) =>{
			for(let i=0; i<grid1.getRowCount(); i++) {
				grid1.removeRowClassName(grid1.getRow(i).rowKey,'basCdColor')				
			}
			if(ev.columnName === 'prdCd' || ev.columnName === 'prdNm'){	
				prdCode1 = {'prdCd':grid1.getValue(ev.rowKey,'prdCd')};
				console.log(prdCode1);
				
				//제품상세정보 받아오기
				$.ajax({
					url:'./admPrdDtlList',
					dataType:'json',
					data : prdCode1,
					async : false
				}).done(function(datas) {
					PrdDtl = datas.data.contents[0];
					console.log(PrdDtl);
					document.getElementById('prdCd').value = PrdDtl.prdCd;
					document.getElementById('prdNm').value = PrdDtl.prdNm;
					document.getElementById('prdStdNm').value = PrdDtl.prdStd;
					document.getElementById('mngUnitNm').value = PrdDtl.mngUnit;
					document.getElementById('prdSectNm').value = PrdDtl.prdSect;
					document.getElementById('ableLineNo').value = PrdDtl.ableLineNo;
					
					if(PrdDtl.useYn == 'Y') {
						document.getElementById('useYn').checked = true
					} else {
						document.getElementById('useYn').checked = false
					}
					
					 //console.log($('#flwFrm').serializeObject());
					//제품코드는 수정 안되게 막아주기
					document.getElementById('prdCd').setAttribute('readonly',true);
					document.getElementById('btnAddPrd').setAttribute('disabled', true);
					document.getElementById('btnEditPrd').disabled = undefined;	
					document.getElementById('btnDelPrd').disabled = undefined;	
	
					prdCodeVal = $('#prdCd').val();
					prdCode2 = {'prdCd' : prdCodeVal};
					grid2.readData(1,prdCode2,true);
					grid1.addRowClassName(ev.rowKey,'basCdColor');
				})
			}
		})
		
		//수정버튼
		btnEditPrd.addEventListener("click", function() {
			if(!confirm("수정하시겠습니까?")){
				return false;
			}
			$.ajax({
				url: "./updatePrd",
				method: "POST",
				data: $('#flwFrm').serializeObject(),
				dataType: 'json',
				success: function(result) {
					console.log("수정완료!!!!!!!!!!!")
					grid1.resetData(result);
					prdCodeVal = document.getElementById('prdCd').value;
					for(prdCdData of grid1.getData()) {
						if(prdCodeVal == prdCdData.prdCd) {
							console.log("if문 들어오는지");
							grid1.focus(prdCdData.rowKey, 'prdCd', true);
						}
					}
				}
			})
			alert("수정되었습니다~~");
		})	
		
		//등록버튼
		btnAddPrd.addEventListener("click", function() {
			if(document.getElementById('prdCd').value == '') {
				alert("제품코드는 필수입력칸입니다!!");
				return;
			} else if(document.getElementById('prdNm').value == '') {
				alert("제품명은 필수입력칸입니다!!");
				return;
			} else if(document.getElementById('prdStdNm').value == '') {
				alert("제품규격은 필수입력칸입니다!!");
				return;
			} else if(document.getElementById('mngUnitNm').value == '') {
				alert("관리단위는 필수입력칸입니다!!");
				return;
			} else if(document.getElementById('prdSectNm').value == '') {
				alert("제품구분은 필수입력칸입니다!!");
				return;
			} else if(document.getElementById('ableLineNo').value == '') {
				alert("공정라인은 필수입력칸입니다!!");
				return;
			} else{
				if(!confirm("등록하시겠습니까?")){
					return false;
				}
			}			
			$.ajax({
				url: "./insertPrd",
				method: "POST",
				data: $('#flwFrm').serializeObject(),
				dataType: 'json',
				success: function(result) {
					console.log("등록완료!!!!!!!!!!!")
					console.log(result);
					grid1.resetData(result);
					prdCodeVal = document.getElementById('prdCd').value;
					for(prdCdData of grid1.getData()) {
						if(prdCodeVal == prdCdData.prdCd) {
							console.log("if문 들어오는지");
							grid1.focus(prdCdData.rowKey, 'prdCd', true);
							document.getElementById('btnAddPrd').setAttribute('disabled', true);
							document.getElementById('btnEditPrd').disabled = undefined;	
							document.getElementById('btnDelPrd').disabled = undefined;	
						}
					}
				}
			})
			
		})
		
		//초기화버튼
		btnReset.addEventListener("click", function() {
			if(!confirm("초기화하시겠습니까?")){
				return false;
			}
			formClear();	
		})
		
		//초기화함수
		function formClear() {
			document.getElementById('prdCd').value = '';
			document.getElementById('prdNm').value = '';
			document.getElementById('prdStdNm').value = '';
			document.getElementById('mngUnitNm').value = '';
			document.getElementById('prdSectNm').value = '';
			document.getElementById('ableLineNo').value = '';
			document.getElementById('prdCd').readOnly = false;
			document.getElementById('useYn').checked = false;
			grid2.clear();
			document.getElementById('btnAddPrd').disabled = undefined;
			document.getElementById('btnEditPrd').setAttribute('disabled', true);
			document.getElementById('btnDelPrd').setAttribute('disabled', true);
		}
		
		//삭제버튼
		btnDelPrd.addEventListener("click", function() {
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}
			$.ajax({
				url: "./deletePrd",
				method: "POST",
				data: $('#flwFrm').serializeObject(),
				dataType: 'json',
				success: function(result) {
					console.log("삭제완료!!!!!!!!!!!")
					grid1.resetData(result);
					grid1.focus(grid1.getRowCount()-1,'prdCd',true);
				}
			})
			formClear();	
		})
		
		//제품검색 대문자로 입력받기
		$("#prdCd").bind("keyup", function() {
     		console.log("대문자로 입력받기")
       		$(this).val($(this).val().toUpperCase());
  		});
		
		//제품검색 엔터키
		function enterPrdCd() {
			
			prdCodeVal = document.getElementById('prdCd').value;
			if(window.event.keyCode == 13){
				console.log('엔터키 이벤트 성공')	
				let flag = true
				for(prdCdData of grid1.getData()) {
					if(prdCdData.prdCd == prdCodeVal) {
						document.getElementById('prdCd').value = prdCdData.prdCd;
						document.getElementById('prdNm').value = prdCdData.prdNm;
						document.getElementById('prdStdNm').value = prdCdData.prdStd;
						document.getElementById('mngUnitNm').value = prdCdData.mngUnit;
						document.getElementById('prdSectNm').value = prdCdData.prdSect;
						document.getElementById('ableLineNo').value = prdCdData.ableLineNo;
						
						if(prdCdData.useYn == 'Y') {
							document.getElementById('useYn').checked = true
						} else {
							document.getElementById('useYn').checked = false
						}
						document.getElementById('btnAddPrd').setAttribute('disabled', true);
						document.getElementById('btnEditPrd').disabled = undefined;	
						document.getElementById('btnDelPrd').disabled = undefined;	
						
						document.getElementById('prdCd').readOnly = true;
						flag = true;
						break;
					} else {
						flag = false;
					}
				}
				if(flag == false){
					alert("등록가능한 제품코드입니다");
				}
			}
		}

	//제품 기능 끝-------------------------------------
	
	//공정흐름 기능 시작 (그리드2)-------------------------
	
		//그리드2 다 업뎃후에 공정흐름갯수세기
	 	grid2.on('onGridUpdated',function() {
	 		flwCnt = grid2.getRowCount();
	 		grid2GetDataDel = grid2.getData();
	 	})	
		
		//저장버튼
		let btnSave = document.getElementById('btnSave');
		btnSave.addEventListener("click", function() {
			grid2.blur();
			grid2GetDataIns = grid2.getData();
			//필수입력칸
		    rowk = grid2.getRowCount();
			for(i=0; i<rowk; i++) {
				if(grid2.getRow(i).prcSeq == '') {
					alert("공정순서는 필수입력칸입니다!!");
					return;
				} else if(grid2.getRow(i).prcNm == '') {
					alert("공정명은 필수입력칸입니다!!");
					return;
				} else if(grid2.getRow(i).stdLoad == '') {
					alert("기준부하율은 필수입력칸입니다!!");
					return;
				} else if(grid2.getRow(i).unitCost == '') {
					alert("단가는 필수입력칸입니다!!");
					return;
				} else if(grid2.getRow(i).leadTime == '') {
					alert("LEAD타임은 필수입력칸입니다!!");
					return;
				}
			} 	
			
			//공정흐름 원래있던거 삭제
			$.ajax({
				url: "./deleteFlw",
				method: "POST",
				data: JSON.stringify(grid2GetDataDel),
				async : false,
				dataType: 'json',
				contentType: 'application/json',
				success: function(result) {
					console.log("삭제완료!!!!!!!!!!!")
				}
			}) 
			
			//공정흐름 수정한뒤에 수정한것 가져와서 인서트
			$.ajax({
				url: "./insertFlw",
				method: "POST",
				data: JSON.stringify(grid2GetDataIns),
				async : false,
				dataType: 'json',
				contentType: 'application/json',
				success: function(result) {
					console.log("등록완료!!!!!!!!!!!")
					grid2.focus(grid2.getRowCount()-1,'prcSeq',true);
				}
			}) 
		})
		
/* 		//모달설정
		let dialog;
		dialog = $( "#dialog-form" ).dialog({
			autoOpen : false,
			modal : true,
			resizable: false,
			height: "auto",
			width: 300
		}); */
		
	
		//모달창내에서 더블클릭
		function getModalBas(param){
			//선택한 값 parameter받아서 각자 처리
			//각각의 인풋에 값 넣어주기 위해서 if문 쓰기
			if(param.dtlCd.includes('PDT_SECT')) {
				$("#prdSectNm").val(param.dtlNm);
				$("#prdSect").val(param.dtlCd);
			} else if(param.dtlCd.includes('MTR')) {
				$("#mngUnitNm").val(param.dtlNm);
				$("#mngUnit").val(param.dtlCd);
			} else {
				$("#prdStdNm").val(param.dtlNm);
				$("#prdStd").val(param.dtlCd);
			}
			//console.log(param.dtlNm);
			dialog.dialog("close");
		} 
	
		//사용공정명 더블클릭 모달띄우기
		grid2.on("dblclick", (ev)=> {
			if (ev.columnName === 'prcNm') {
				rowk = ev.rowKey;
				mPrc();
				$('#ui-id-1').html('사용공정명');
			}
		})
		
		//사용공정명 더블클릭한 모달창 안에서 더블클릭
		function getModalPrc(param) {
			console.log("더블클릭공정");
			grid2.setValue(rowk, "prcCd", param.prcCd, false);
			grid2.setValue(rowk, "prcNm", param.prcNm, false);
			dialog.dialog("close");	
		}
		
		//모달사이즈
		dialog = $( "#dialog-form" ).dialog({
			autoOpen : false,
			modal : true,
			resizable: false,
			height: "auto",
			width: 650,
			height: 520
		});
		
	
	//공정흐름 기능 끝 (그리드2)-------------------------

</script>
</body>
</html>