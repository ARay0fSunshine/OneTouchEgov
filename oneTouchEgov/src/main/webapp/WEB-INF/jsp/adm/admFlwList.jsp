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

<style>
.hr4{
	margin-top: 0.45rem !important;
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
	height: 235px;
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
</style>

</head>
<body>
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
			<h4 class="gridtitle">?제품목록</h4>
			<span class="floatright">
				<button type="button" id="btnAdd" class="btn btn-main newalign2">추가</button>
			</span>
			<br><br>
			<hr class="hr4">
			<div id="grid1"></div>
		</div>
		
		<div class= "col-8">
			<span class="floatright">
				<button type="button" id="btnEdit" class="btn btn-main newalign2">수정</button>
				<button type="button" id="btnDel" class="btn btn-main newalign2">삭제</button>
				<button type="button" id="btnSave" class="btn btn-primary newalign2">저장</button>
			</span>
			<br><br>
			<hr>
			<div class="row row1">
				<div class="col-md-12 grid-margin stretch-card">
					<div class="card bascard">
						<div class="card-body bascard1">
							<h4 class="card-title">제품상세정보</h4>
							<form id="flwFrm" name="flwFrm" method="post">
								<div class="rowdiv">
									<label class="labeltext">제품코드&nbsp;</label>
									<input id="prdCd" name="prdCd" class="inputtext" readonly>
									<label class="labeltext colline1">제품명&nbsp;</label>
									<input id="prdNm" name="prdNm" class="inputtext" readonly>
								</div>
								
								<div class="rowdiv">
									<label class="labeltext">제품규격&nbsp;</label>
									<input id="prdStdNm" name="prdStdNm" class="inputtext">
									<button type="button" id="btnprdStd" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button>
									
									<label class="labeltext colline2">관리단위&nbsp;</label>
									<input id="mngUnitNm" name="mngUnitNm" class="inputtext">
									<button type="button" id="btnmngUnit" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button>
								</div>
								
								<div class="rowdiv">
									<label class="labeltext">제품구분&nbsp;</label>
									<input id="prdSectNm" name="prdSectNm" class="inputtext">
									<button type="button" id="btnprdSect" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button>
									
									<input type="hidden" id="prdSect" name="prdSect">
									<input type="hidden" id="mngUnit" name="mngUnit">
									<input type="hidden" id="prdStd" name="prdStd">
									
									<label class="labeltext colline2">사용여부</label>&emsp;&nbsp;
									<span class="form-check form-check-flat form-check-primary inline">
										<label class="form-check-label chkboxalign">
											<!-- 사용여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
											<input id="useYn" name="useYn" type="checkbox" class="form-check-input" readonly>
										</label>
									</span>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<h4 class="gridtitle">?공정흐름</h4><br>
			<span class="floatright">
				<button type="button" id="btnFlw" class="btn btn-main newalign2">공정흐름보기</button>
				<button type="button" id="btnDel" class="btn btn-main newalign2">공정흐름지우기</button>
				<button type="button" id="btnSave" class="btn btn-primary newalign2">저장</button>
			</span>
			
			<br><br>
			<hr>
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
		<button id="btnAddPrd">추가</button>
		<button id="btnDelPrd">삭제</button>
		<button id="btnSavePrd">저장</button><hr>
	</div>
	<div id="grid1"></div>
	<br>
</div>
<div class= "col-8">
	<h4>✔제품상세정보</h4>
	<div align="right" style="margin-right: 3%;">
		<button id="btnEdit">수정</button><hr>
	</div>
	<form id="flwFrm" name="flwFrm" method="post">
		<label>제품코드&nbsp;</label><input id="prdCd" name="prdCd" readonly><br>
		<label>제품명&emsp;&nbsp;</label><input id="prdNm" name="prdNm" readonly><br>
		<label>제품규격&nbsp;</label><input id="prdStdNm" name="prdStdNm">
			<button type="button" id="btnprdStd">🔍</button><br>
		<label>관리단위&nbsp;</label><input id="mngUnitNm" name="mngUnitNm">
			<button type="button" id="btnmngUnit">🔍</button><br>
		<label>제품구분&nbsp;</label><input id="prdSectNm" name="prdSectNm">
			<button type="button" id="btnprdSect">🔍</button><br>
		<input type="hidden" id="prdSect" name="prdSect">
		<input type="hidden" id="mngUnit" name="mngUnit">
		<input type="hidden" id="prdStd" name="prdStd">
		<label>사용여부&nbsp;</label><input id="useYn" name="useYn" type="checkbox" style="width: 20px;">
	</form>
		<label>공정라인&nbsp;</label><select id="ableLineNo" name="ableLineNo"></select><br>
	<div align="right" style="margin-right: 3%;">
	<hr>
	<button id="btnFlw" type="button">공정흐름보기</button>
	<button id="btnDel" type="button">공정흐름지우기</button>
	<button id="btnSave" type="button">저장</button>
	</div>
	<h4>✔공정흐름</h4><br>
	<div id="grid2"></div>
	<div id="dialog-form" title="title"></div>
</div>
</div> -->

<script type="text/javascript">
	let prdCode1;
	let prdCode2;
	let PrdDtl;
	let lineSplit =[];
	let Grid = tui.Grid;
	
	Grid.applyTheme('default',{
		cell:{
			/* header:{
				background:'#eef'
			} */
			header: {
	            background: '#4B49AC',
	            text: '#fff'
	        },
	        evenRow: {
	        	background:'#F5F7FF'
	        }
		}
	})
	
	const columns1 = [{
		
			header : '제품코드',
			name : 'prdCd',
			sortable : true, //정렬
			editor : 'text'
		},
		{
			header : '제품명',
			name : 'prdNm',
			sortable : true,
			editor : 'text'
		}];
	
	const columns2 = [{
		
		header : '공정순서',
		name : 'prcSeq',
		sortable : true
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
		editor : 'text'
	},
	{
		header : '단가',
		name : 'unitCost',
		editor : 'text'
	},
	{
		header : 'LEAD타임',
		name : 'leadTime',
		editor : 'text'
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
	
	const grid1 = new Grid({
		el: document.getElementById('grid1'),
		data: dataSource1,
		columns: columns1,
		bodyHeight: 650,
		minBodyHeight: 650,
		rowHeaders : [ 'checkbox' ]
	});
	
	const grid2 = new Grid({
		el: document.getElementById('grid2'),
		data: dataSource2,
		columns: columns2,
		bodyHeight: 280,
		minBodyHeight: 280
	})

	//제품명 클릭하면 제품상세정보 받아옴
	grid1.on("click", (ev) =>{
		if(ev.columnName === 'prdCd' || ev.columnName === 'prdNm'){
			if(grid1.getValue(ev.rowKey,'prdCd') != null ||
					grid1.getValue(ev.rowKey,'prdNm') != null) {
				
				prdCode1 = {'prdCd':grid1.getValue(ev.rowKey,'prdCd')};
				console.log(prdCode1);
				$('#ableLineNo').empty();
				
				//제품상세정보 받아오기
				$.ajax({
					url:'./admPrdDtlList',
					dataType:'json',
					data : prdCode1,
					async : false
				}).done(function(datas) {
					PrdDtl = datas.data.contents[0];
					console.log(PrdDtl);
					document.getElementById('prdCd').setAttribute('value',PrdDtl.prdCd);
					document.getElementById('prdNm').setAttribute('value',PrdDtl.prdNm);
					document.getElementById('prdStdNm').setAttribute('value',PrdDtl.prdStdNm);
					document.getElementById('mngUnitNm').setAttribute('value',PrdDtl.mngUnitNm);
					document.getElementById('prdSectNm').setAttribute('value',PrdDtl.prdSectNm);
					document.getElementById('prdStd').setAttribute('value',PrdDtl.prdStd);
					document.getElementById('mngUnit').setAttribute('value',PrdDtl.mngUnit);
					document.getElementById('prdSect').setAttribute('value',PrdDtl.prdSect);
					
					if(PrdDtl.useYn == 'Y') {
						document.getElementById('useYn').checked = true
					} else {
						document.getElementById('useYn').checked = false
					}
					
					
					lineSplit = PrdDtl.ableLineNo.split('/');
					for(i=0;i<lineSplit.length;i++) {
						let option = document.createElement('option');
						option.value = lineSplit[i];
						option.innerHTML = lineSplit[i];
						document.getElementById('ableLineNo').appendChild(option);
					}
					console.log($('#flwFrm').serialize());
	
					})
			}
		}
	})

	//공정흐름보기 버튼
	btnFlw.addEventListener("click", function() {
		prdCode2 = {'prdCd' : $('#prdCd').val()};
		console.log(prdCode2);
		grid2.readData(1,prdCode2,true);
	})
	
	//공정흐름지우기 버튼
	btnDel.addEventListener("click", function(){
		/* grid2.checkAll();	
		grid2.removeCheckedRows(true); */
		cnt = grid2.getRowCount();
		for(i=0; i<cnt; i++) {
			grid2.removeRow(i);
		}
	})
	
	//저장버튼
	btnSave.addEventListener("click", function() {
		grid2.blur();
		grid2.request('modifyData');
	})
	
	//제품규격검색버튼
	btnprdStd.addEventListener("click", function() {
		mBas('PDT_SIZE');
		$('#ui-id-1').html('제품규격종류');
	})
	
	//단위검색버튼
	btnmngUnit.addEventListener("click", function() {
		mBas('MTR_UNIT');
		$('#ui-id-1').html('단위구분');
	})
	
	//제품구분검색버튼
	btnprdSect.addEventListener("click", function() {
		mBas('PDT_SECT');
		$('#ui-id-1').html('제품구분');
	})

	
	//모달설정
	let dialog;
	dialog = $( "#dialog-form" ).dialog({
		autoOpen : false,
		modal : true,
		resizable: false,
		height: "auto",
		width: 300
	});
	

	//모달창내에서 더블클릭
	function getModalBas(param){
		//선택한 값 parameter받아서 각자 처리
		//각각의 인풋에 값 넣어주기 위해서 if문 쓰기
		if(param.dtlCd.includes('PDT_SECT')) {
			console.log("1")
			$("#prdSectNm").val(param.dtlNm);
			$("#prdSect").val(param.dtlCd);
		} else if(param.dtlCd.includes('MTR')) {
			console.log("2")
			$("#mngUnitNm").val(param.dtlNm);
			$("#mngUnit").val(param.dtlCd);
		} else {
			console.log("3")
			$("#prdStdNm").val(param.dtlNm);
			$("#prdStd").val(param.dtlCd);
		}
		//console.log(param.dtlNm);
		dialog.dialog("close");
	} 

	
	
	//수정버튼
	btnEdit.addEventListener("click", function() {
		//console.log($('#useYn').is(':checked'));
		//console.log($('#flwFrm'));
		//console.log(document.getElementById('useYn').getAttribute('value'));
		if(!confirm("수정하시겠습니까?")){
			return false;
		}
		$.ajax({
			url: "./updatePrd",
			method: "POST",
			data: $('#flwFrm').serializeObject(),
			dataType: 'json',
			//contentType: 'application/json',
			success: function(result) {
				console.log("수정완료!!!!!!!!!!!")
				console.log(result)
			}
		})
	})	
	
	//등록버튼
	btnAddPrd.addEventListener("click", function() {
		grid1.appendRow({});
	})	
	
	//삭제버튼
	btnDelPrd.addEventListener("click", function() {
		grid1.removeCheckedRows(true);
	})
	
	//저장버튼
	btnSavePrd.addEventListener("click", function() {
		grid1.blur();
		grid1.request('modifyData');
	})
	
</script>
</body>
</html>