<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자재정보관리</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="${path}/resources/js/modal.js"></script>
<script src="${path}/resources/js/grid-common.js"></script>

<style>
hr{
	margin-top: 0.4rem !important;
}
.labeltext{
	width: 120px !important;
}
.bascard1{
	height: 681px;
}
.inline{
	display: inline-block;
	margin-left: 0px !important;
	margin-top: 10px !important;
	margin-botton: 0px !important;
	margin-bottom: 0px !important;
}
.rowdiv{
	margin-bottom: 15px !important;
}
.form-check .form-check-label input[type="checkbox"] + .input-helper:before, .form-check .form-check-label input[type="checkbox"] + .input-helper:after{
	top: 3px !important;
	left: -20px !important;
}
.mtrFrm{
	margin-top: 40px;
	margin-left: 30px;
}
.mtrCdColor{
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
					<h3 class="font-weight-bold page-title">자재정보관리</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="flex row">
		<div class = "col-4">
			<h4 class="gridtitle">✔자재목록</h4>
			<span class="floatright">
				
			</span>
			<br><br>
			<hr>
			<div id="grid"></div>
		</div>
		<div class= "col-8">
			<h4 class="gridtitle">✔자재상세정보</h4>
			<span class="floatright">
				<button type="button" id="btnReset" class="btn btn-main newalign2">초기화</button>
				<button type="button" id="btnAdd" class="btn btn-main newalign2">등록</button>
				<button type="button" id="btnDel" class="btn btn-main newalign2">삭제</button>
				<button type="button" id="btnEdit" class="btn btn-primary newalign2">수정</button>
			</span>
			<br><br>
			<hr>
			<div class="card bascard">
				<div class="card-body bascard1">
					<!-- <h4 class="card-title">기초코드</h4> -->
					<form id="mtrFrm" name="mtrFrm" class="mtrFrm" method="post" onsubmit="return false">
						<div class="rowdiv">
							<label class="labeltext">자재코드&nbsp;</label>
							<input id="mtrCd" name="mtrCd" class="inputtext" onkeyup="entermtrCd()">
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">자재명&emsp;&nbsp;</label>
							<input id="mtrNm" name="mtrNm" class="inputtext">
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">자재규격&nbsp;</label>
							<select id="stdNm" name="std" class="inputtext"></select>
							<!-- <button type="button" id="btnStd" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button> -->
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">관리단위&nbsp;</label>
							<select id="unitNm" name="unit" class="inputtext"></select>
							<!-- <button type="button" id="btnUnit" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button> -->
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">자재구분&nbsp;</label>
							<select id="mtrSectNm" name="mtrSect" class="inputtext"></select>
							<!-- <button type="button" id="btnMtrSect" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button> -->
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">업체명&emsp;&nbsp;</label>
							<input id="compNm" name="compNm" class="inputtext">
							<button type="button" id="btnCompCd" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button>
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">관리수량&nbsp;</label>
							<input id="mngAmt" name="mngAmt" class="inputtext">
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">안전재고&nbsp;</label>
							<input id="safeStck" name="safeStck" class="inputtext">
							<!-- <input type="hidden" id="std" name="std">
							<input type="hidden" id="unit" name="unit">
							<input type="hidden" id="mtrSect" name="mtrSect"> -->
							<input type="hidden" id="compCd" name="compCd">
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">사용여부</label>&emsp;&nbsp;
							<span class="form-check form-check-flat form-check-primary inline">
								<label class="form-check-label chkboxalign">
									<!-- 사용여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
									<input id="useYn" name="useYn" type="checkbox" class="form-check-input">
								</label>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div id="dialog-form" title="title"></div>
</div>


<!-- <br>
<h3>[자재정보관리]</h3>
<hr>
<div class="flex row">
	<div class = "col-4">
		<h4>✔자재목록</h4>
		<div align="right">
			<button id="btnAdd">등록</button><hr>
		</div>
		<div id="grid"></div>
		<br>
	</div>
	<div class= "col-8">
		<h4>✔자재상세정보</h4>
		<div align="right" style="margin-right: 3%;">
			<button id="btnEdit">수정</button><hr>
		</div>
			<form id="mtrFrm" name="mtrFrm" method="post">
				<label>자재코드&nbsp;</label><input id="mtrCd" name="mtrCd" readonly><br>
				<label>자재명&emsp;&nbsp;</label><input id="mtrNm" name="mtrNm" readonly><br>
				<label>자재규격&nbsp;</label><input id="stdNm" name="stdNm">
					<button type="button" id="btnStd">🔍</button><br>
				<label>관리단위&nbsp;</label><input id="unitNm" name="unitNm">
					<button type="button" id="btnUnit">🔍</button><br>
				<label>자재구분&nbsp;</label><input id="mtrSectNm" name="mtrSectNm">
					<button type="button" id="btnMtrSect">🔍</button><br>
				<label>업체명&emsp;&nbsp;</label><input id="compNm" name="compNm">
					<button type="button" id="btnCompCd">🔍</button><br>
				<label>관리수량&nbsp;</label><input id="mngAmt" name="mngAmt" readonly><br>
				<label>안전재고&nbsp;</label><input id="safeStck" name="safeStck" readonly><br>
				<input type="hidden" id="std" name="std">
				<input type="hidden" id="unit" name="unit">
				<input type="hidden" id="mtrSect" name="mtrSect">
				<input type="hidden" id="compCd" name="compCd">
				<label>사용여부&nbsp;</label><input id="useYn" name="useYn" type="checkbox" style="width: 20px;">
			</form>
			<div id="dialog-form" title="title"></div>
	</div>
</div> -->


<script type="text/javascript">
	/* let Grid = tui.Grid; */
	let rowk;
	let mtrCodeVal;
	
	//페이지 로드되면 수정막기
	document.getElementById('btnEdit').setAttribute('disabled', true);
	document.getElementById('btnDel').setAttribute('disabled', true);
	
	/* Grid.applyTheme('default',{
		cell:{
			header: {
	            background: '#4B49AC',
	            text: '#fff'
	        }
		}
	}) */
	
	const columns = [{
		
			header : '자재코드',
			name : 'mtrCd',
			sortable : true //정렬
		},
		{
			header : '자재명',
			name : 'mtrNm',
			sortable : true
		}];
	
	//자재규격 상세코드에서 받아오기
	$.ajax({
		url: './mtrSizeList',
		dataType:'json',
		async : false
	}).done(function(datas){
		for(data of datas) {
			$('#stdNm').append("<option value="+data.std+">"+data.stdNm+"</option>")
			document.getElementById('stdNm').value = '';
		}
	});
	
	//단위구분 상세코드에서 받아오기
	$.ajax({
		url: './mtrUnitList',
		dataType:'json',
		async : false
	}).done(function(datas){
		console.log(datas)
		for(data of datas) {
			$('#unitNm').append("<option value="+data.mngUnit+">"+data.mngUnitNm+"</option>")
			document.getElementById('unitNm').value = '';
		}
	});
	
	//자재구분 상세코드에서 받아오기
	$.ajax({
		url: './mtrSectList',
		dataType:'json',
		async : false
	}).done(function(datas){
		for(data of datas) {
			$('#mtrSectNm').append("<option value="+data.mtrSect+">"+data.mtrSectNm+"</option>")
			document.getElementById('mtrSectNm').value = '';
		}
	});
	
	const dataSource = {
			api: {
				readData: {
					url:'./admMtrList',
					method: 'GET'
				},
				modifyData: {
					url: './mtrModifyData',
					method: 'POST'
				}
			},
			contentType: 'application/json'
		};
	
	const grid = new Grid({
		el: document.getElementById('grid'),
		data: dataSource,
		columns,
		bodyHeight: 642,
		minBodyHeight: 642,
	});
	
	grid.on("click", (ev) => {
		for(let i=0; i<grid.getRowCount(); i++) {
			grid.removeRowClassName(grid.getRow(i).rowKey,'mtrCdColor')				
		}
		if(ev.columnName === 'mtrCd' || ev.columnName === 'mtrNm') {
			
			mtrCode = {'mtrCd': grid.getValue(ev.rowKey,'mtrCd')};
			
			//자재상세정보 받아오기
			$.ajax({
				url:'./admMtrDtlList',
				dataType:'json',
				data : mtrCode,
				async : false
			}).done(function(datas) {
				MtrDtl = datas.data.contents[0];
				console.log(MtrDtl);
				document.getElementById('mtrCd').value = MtrDtl.mtrCd;
				document.getElementById('mtrNm').value = MtrDtl.mtrNm;
				document.getElementById('stdNm').value = MtrDtl.std;
				document.getElementById('unitNm').value = MtrDtl.unit;
				document.getElementById('mtrSectNm').value = MtrDtl.mtrSect;
				document.getElementById('compNm').value = MtrDtl.compNm;
				document.getElementById('mngAmt').value = MtrDtl.mngAmt;
				document.getElementById('safeStck').value = MtrDtl.safeStck;
				document.getElementById('compCd').value = MtrDtl.compCd;
				
				if(MtrDtl.useYn == 'Y') {
					document.getElementById('useYn').checked = true
				} else {
					document.getElementById('useYn').checked = false
				}
				
				//자재코드는 수정 안되게 막아주기
				document.getElementById('mtrCd').setAttribute('readonly',true);
				document.getElementById('btnAdd').setAttribute('disabled', true);
				document.getElementById('btnEdit').disabled = undefined;
				document.getElementById('btnDel').disabled = undefined;
				grid.addRowClassName(ev.rowKey,'mtrCdColor');
			})
		}
	})
	

/* 	//자재규격검색버튼
	btnStd.addEventListener("click", function() {
		mBas('MTR_SIZE');
		$('#ui-id-1').html('자재규격종류');
	});
	
	//관리단위검색버튼
	btnUnit.addEventListener("click", function() {
		mBas('MTR_UNIT');
		$('#ui-id-1').html('관리단위');
	});
	
	//자재구분검색버튼
	btnMtrSect.addEventListener("click", function() {
		mBas('MTR_SECT');
		$('#ui-id-1').html('자재구분');
	}); */
	
	//업체명검색버튼
	btnCompCd.addEventListener("click", function() {
		mBas('MTR_COM');
		$('#ui-id-1').html('업체명');
	});
	
	//모달설정
	let dialog;
	dialog = $( "#dialog-form" ).dialog({
		autoOpen : false,
		modal : true,
		resizable: false,
		height: "auto",
		width: 400,
		height: 300
	});
	
	//모달창내에서 더블클릭
	function getModalBas(param){
		//선택한 값 parameter받아서 각자 처리
		//각각의 인풋에 값 넣어주기 위해서 if문 쓰기
		//console.log(param);
		if(param.dtlCd.includes('SIZE')) {
			$("#stdNm").val(param.dtlNm);
			$("#std").val(param.dtlCd);
		} else if(param.dtlCd.includes('UNIT')) {
			$("#unitNm").val(param.dtlNm);
			$("#unit").val(param.dtlCd);
		} else if(param.dtlCd.includes('SECT')) {
			$("#mtrSectNm").val(param.dtlNm);
			$("#mtrSect").val(param.dtlCd);
		} else {
			$("#compNm").val(param.dtlNm);
			$("#compCd").val(param.dtlCd);
		}
		//console.log(param.dtlNm);
		dialog.dialog("close");
	} 
	
	//수정버튼
	btnEdit.addEventListener("click", function() {
		if(!confirm("수정하시겠습니까?")){
			return false;
		}
		$.ajax({
			url: "./updateMtr",
			method: "POST",
			data: $('#mtrFrm').serializeObject(),
			dataType: 'json',
			//contentType: 'application/json',
			success: function(result) {
				console.log("수정완료!!!!!!!!!!!")
				grid.resetData(result);
				mtrCodeVal = document.getElementById('mtrCd').value;
				for(mtrCdData of grid.getData()) {
					if(mtrCodeVal == mtrCdData.mtrCd) {
						console.log("if문 들어오는지");
						grid.focus(mtrCdData.rowKey, 'mtrCd', true);
					}
				}
			}
		})
		alert("수정되었습니다~~");
	})
	

	//등록버튼
	btnAdd.addEventListener("click", function() {
		if(document.getElementById('mtrCd').value == '') {
			alert("자재코드는 필수입력칸입니다!!");
			return;
		} else if(document.getElementById('mtrNm').value == '') {
			alert("자재명은 필수입력칸입니다!!");
			return;
		} else if(document.getElementById('stdNm').value == '') {
			alert("자재규격은 필수입력칸입니다!!");
			return;
		} else if(document.getElementById('unitNm').value == '') {
			alert("관리단위는 필수입력칸입니다!!");
			return;
		} else if(document.getElementById('mtrSectNm').value == '') {
			alert("자재구분은 필수입력칸입니다!!");
			return;
		} else if(document.getElementById('compNm').value == '') {
			alert("업체명은 필수입력칸입니다!!");
			return;
		} else if(document.getElementById('mngAmt').value == '') {
			alert("관리수량은 필수입력칸입니다!!");
			return;
		} else if(document.getElementById('safeStck').value == '') {
			alert("안전재고는 필수입력칸입니다!!");
			return;
		} else{
			if(!confirm("등록하시겠습니까?")){
				return false;
			}
		}
		$.ajax({
			url: "./insertMtr",
			method: "POST",
			data: $('#mtrFrm').serializeObject(),
			dataType: 'json',
			success: function(result) {
				console.log("등록완료!!!!!!!!!!!")
				grid.resetData(result);
				mtrCodeVal = document.getElementById('mtrCd').value;
				for(mtrCdData of grid.getData()) {
					if(mtrCodeVal == mtrCdData.mtrCd) {
						console.log("if문 들어오는지");
						grid.focus(mtrCdData.rowKey, 'mtrCd', true);
						document.getElementById('btnAdd').setAttribute('disabled', true);
						document.getElementById('btnEdit').disabled = undefined;	
						document.getElementById('btnDel').disabled = undefined;	
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
		document.getElementById('mtrCd').value = '';
		document.getElementById('mtrNm').value = '';
		document.getElementById('stdNm').value = '';
		document.getElementById('unitNm').value = '';
		document.getElementById('mtrSectNm').value = '';
		document.getElementById('compNm').value = '';
		document.getElementById('mngAmt').value = '';
		document.getElementById('safeStck').value = '';
		document.getElementById('compCd').value = '';
		document.getElementById('mtrCd').readOnly = false;
		document.getElementById('useYn').checked = false;
		document.getElementById('btnAdd').disabled = undefined;
		document.getElementById('btnEdit').setAttribute('disabled', true);
		document.getElementById('btnDel').setAttribute('disabled', true);
		
		for(let i=0; i<grid.getRowCount(); i++) {
			grid.removeRowClassName(grid.getRow(i).rowKey,'mtrCdColor')				
		}	
	}
	
	//삭제버튼
	btnDel.addEventListener("click", function() {
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
		$.ajax({
			url: "./deleteMtr",
			method: "POST",
			data: $('#mtrFrm').serializeObject(),
			dataType: 'json',
			success: function(result) {
				console.log("삭제완료!!!!!!!!!!!")
				grid.resetData(result);
				grid.focus(grid.getRowCount()-1,'mtrCd',true);
			}
		}) 
		formClear();
	})
	
	//자재검색 대문자로 입력받기
	$("#mtrCd").bind("keyup", function() {
     		console.log("대문자로 입력받기")
       		$(this).val($(this).val().toUpperCase());
  	});
	
	//자재검색 엔터키
	function entermtrCd() {
		mtrCodeVal = document.getElementById('mtrCd').value;
		if(window.event.keyCode == 13){
			console.log('엔터키 이벤트 성공')
			let flag = true
			for(mtrCdData of grid.getData()) {
				if(mtrCdData.mtrCd == mtrCodeVal) {
					document.getElementById('mtrCd').value = mtrCdData.mtrCd;
					document.getElementById('mtrNm').value = mtrCdData.mtrNm;
					document.getElementById('stdNm').value = mtrCdData.std;
					document.getElementById('unitNm').value = mtrCdData.unit;
					document.getElementById('mtrSectNm').value = mtrCdData.mtrSect;
					document.getElementById('compNm').value = mtrCdData.compNm;
					document.getElementById('mngAmt').value = mtrCdData.mngAmt;
					document.getElementById('safeStck').value = mtrCdData.safeStck;
					document.getElementById('compCd').value = mtrCdData.compCd;
					
					if(mtrCdData.useYn == 'Y') {
						document.getElementById('useYn').checked = true
					} else {
						document.getElementById('useYn').checked = false
					}
					document.getElementById('btnAdd').setAttribute('disabled', true);
					document.getElementById('btnEdit').disabled = undefined;	
					document.getElementById('btnDel').disabled = undefined;	
					flag = true;
					break;
				} else {
					flag = false;
				}
			}
			if(flag == false){
				alert("등록가능한 자재코드입니다");
			}
		}
	}
	
	
</script>
</body>
</html>