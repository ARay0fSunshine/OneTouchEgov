<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />

<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<link rel="stylesheet" href="${path}/resources/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="${path}/resources/jquery-ui/images">

<script src="${path}/resources/js/grid-common.js"></script>
<script src="${path}/resources/js/modal.js"></script>
</head>
<style type="text/css">
.tui-grid-cell-summary{
	text-align: right;
}
.labeltext{
width: 100px !important;
}
.colline2{
	margin-left: 60px;
	width: 100px !important;
}
.bascard1{
	height:170px;
}
.rowdiv{
	margin-bottom: 10px !important;
}
hr{
	margin-top: -20px;
}
.checkwidth{
	width:110px;
}
.ui-widget{
	z-index: 1000001 !important;
	position: relative;
}
.inModal{
	z-index: 1000002 !important;
	position: relative;
}
</style>
<body>

<div class="content-wrapper">
	<div class="row">
		<div class="col-md-12 grid-margin">
			<div class="row">
				<div class="col-12 col-xl-8 mb-4 mb-xl-0">
					<h3 class="font-weight-bold page-title">재고조정관리</h3>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12 grid-margin stretch-card"><!-- <div style="margin-top: 50px; border-top: 2px solid black; border-bottom : 2px solid black; padding: 5px;">  -->
			<div class="card bascard1">
				<div class="card-body">
					<!-- <h4 class="card-title">조회조건</h4> -->
					<form id="frm" method="post">
						<div class="rowdiv">
							<label class="labeltext">정산일자</label>
							<input type="text" id="startDate" name="startDate" class="datepicker jquerydtpicker">
							<label> ~ </label> 
							<input type="text" id="endDate" name="endDate" class="datepicker jquerydtpicker">
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">자재코드</label>
							<input type="text" id="ditemCode" name="ditemCode" class="inputtext" readonly>
							<button type="button" id="btnMtrCd" class="btn btn-primary mr-2 minibtn" ><i class="icon-search"></i></button>
							<label class="labeltext colline2">자재명</label>
							<input type="text" id="ditemCodeNm" name="ditemCodeNm" class="inputtext" readonly>
						</div>
						
						<label class="labeltext">정산구분</label>
						<div class="form-check checkwidth" style="display:inline-block">
							<label class="form-check-label schCondLabel" for="adjAllRadio">
						  		<input type="radio" class="form-check-input" id="adjAllRadio" name="calSect" value="" checked>
						  		전체
								<i class="input-helper"></i>
							</label>
						</div>
						                
						<div class="form-check checkwidth" style="display:inline-block">
							<label class="form-check-label schCondLabel" for="adjInRadio">
						  		<input type="radio" class="form-check-input" id="adjInRadio" name="calSect" value="MTR_CAL001">
						  		정산입고
								<i class="input-helper"></i>
							</label>
						</div>
						                
						<div class="form-check checkwidth" style="display:inline-block">
						    <label class="form-check-label schCondLabel" for="adjOutRadio">
						  		<input type="radio" class="form-check-input" id="adjOutRadio" name="calSect" value="MTR_CAL002">
						  		정산출고
								<i class="input-helper"></i>
							</label>
						</div>
						
						<span  class="floatright">
							<button type="button" id="btnFind" class="btn btn-primary mr-2 newalign">조회</button>
							<button type="button" id="btnAdd" class="btn btn-main mr-2 newalign">추가</button>
							<button type="button" id="btnDel" class="btn btn-main mr-2 newalign">삭제</button>
							<button type="button" id="btnSave" class="btn btn-primary mr-2 newalign">저장</button>
						</span>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<hr>
	<div id="grid"></div>
	<div id="dialog-form"></div>
	<div id="dialog-lot">
		<form id="mFrm" method="post">
			<div class="rowdiv">
				<label class="labeltext">입고일자</label>
				<input type="text" id="mStartDate" name="startDate" class="datepicker jquerydtpicker inModal">
				<label> ~ </label> 
				<input type="text" id="mEndDate" name="endDate" class="datepicker jquerydtpicker inModal">
				<button type="button" id="btnFindLot" class="btn btn-main mr-2 newalign">검색</button>
			</div>
			<div class="rowdiv">
				<label class="labeltext">자재코드</label>
				<input type="text" id="mDitemCode" name="mtrCd" disabled="disabled">
				<br>
				<label class="labeltext">자재명</label>
				<input type="text" id="mDitemCodeNm" name="mtrNm" disabled="disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="labeltext">단위</label>
				<input type="text" id="mUnitNm" name="unitNm" disabled="disabled">
				<input type="hidden" id="mCalSect" name="calSect">
			</div>
		</form>
	</div>
</div>


	<!-- <div class="container">
		<h3>재고조정 관리</h3>
		<hr>
		<form id="frm" method="post">
			<div>
				<div>
					<label>정산일자</label>
					<input type="Date" id="startDate" name="startDate">&nbsp;
					<label> ~ </label>&nbsp;
					<input type="Date" id="endDate" name="endDate">
				</div>
				<div>
					<label>자재코드</label>
					<input type="text" id="ditemCode" name="ditemCode">
					<button type="button" id="btnMtrCd">ㅇ</button>&nbsp;
					<label>자재명</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="ditemCodeNm" name="ditemCodeNm" disabled="disabled">
				</div>
				<div>
				  <label>정산구분</label>
				  <input type="radio" id="adjAllRadio" name="calSect" value="" checked>
				  <label for="mtrRadio">전체</label>
				  <input type="radio" id="adjInRadio" name="calSect" value="MTR_CAL001">
				  <label for="adjInRadio">정산입고</label>
				  <input type="radio" id="adjOutRadio" name="calSect" value="MTR_CAL002">
				  <label for="adjOutRadio">정산출고</label>
				</div>
			</div>
		</form>
		<div align="right">
			<button type="button" id="btnFind">조회</button>
			<button type="button" id="btnSave">저장</button>
			<button type="button" id="btnAdd">추가</button>
			<button type="button" id="btnDel">삭제</button>
		</div>
		<hr>
	</div>
	<div id="grid"></div>
	<div id="dialog-form">
		<label>자재구분</label>
		<input type="text" id="mDitemCode" name="ditemCode">
		<br>
		<label>입고업체</label>&nbsp;&nbsp;&nbsp;
		<input type="text" id="mDitemCodeNm" name="ditemCodeNm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div id="dialog-lot">
		<label>자재코드</label>
		<input type="text" id="mDitemCode" name="ditemCode" disabled="disabled">
		<br>
		<label>자재명</label>&nbsp;&nbsp;&nbsp;
		<input type="text" id="mDitemCodeNm" name="ditemCodeNm" disabled="disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label>단위</label>
		<input type="text" id="mUnitNm" name="unitNm" disabled="disabled">
	</div> -->

<script type="text/javascript">
let rowk = -1;
let rown = -1;


//---------포맷에 맞게 날짜 구하는 function---------
function getDateStr(dt){
	let year = dt.getFullYear();
	let month = (dt.getMonth() + 1);
	let day = dt.getDate();
	
	month = (month < 10) ? "0" + String(month) : month;
	day = (day < 10) ? "0" + String(day) : day;
	
	return  year + '-' + month + '-' + day;
}
function today() {
	let dt = new Date();
	return getDateStr(dt);
}
function lastMonth() {
	let dt = new Date();
	let month = dt.getMonth();
	dt.setMonth(month -1);
	return getDateStr(dt);
}
document.getElementById('startDate').value = lastMonth();
document.getElementById('endDate').value = today();
document.getElementById('mStartDate').value = lastMonth();
document.getElementById('mEndDate').value = today();
//---------포맷에 맞게 날짜 구하는 function 끝---------


//---------Jquery datepicker---------
	$(function() {
    //input을 datepicker로 선언
    $(".jquerydtpicker").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: true //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능                
        ,showOn: "button" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "${path}/resources/template/images/cal_lb_sm.png" //"http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
        //,buttonText: "선택" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    });                    
    
    //초기값을 오늘 날짜로 설정해줘야 합니다.
  /*   $('#startDate').datepicker('setDate', '-1W'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)     
    $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)    */  
});
//---------Jquery datepicker 끝---------


//---------mainGrid---------
const dataSource = {
	api: {
		readData: { url: './mtrCalForm', method: 'POST' },
		createData: { url: './mtrCalCreate', method: 'POST'},
		deleteData: { url: './mtrCalDelete', method: 'POST'}
	},
	contentType: 'application/json',
	initialRequest: false
};

var mainGrid = new Grid({
     el : document.getElementById('grid'),
     data : dataSource,
     scrollX : false,
     scrollY : true,
     bodyHeight: 474,
     minBodyHeight: 474,
     rowHeaders : [ 'checkbox'],
     columns : [
				 {
				   header: '정산구분',
				   name: 'calSectNm',
				   align: 'center',
				   editor: {
						type: 'radio',
						options: {
					        listItems: [
					          { text: '입고정산', value: '입고정산' },
					          { text: '출고정산', value: '출고정산' }
					        ]
					     }
					},
					validation: {
					   required:true
					},
				   sortable: true
				 },
				 {
				   header: '정산일자',
				   name: 'calDate',
				   align: 'center',
				   editor: {
						type: 'datePicker',
						options: {
						language: 'ko',
						format: 'yyyy-MM-dd'
						}
					},
					validation: {
						required:true
					},
				   sortable: true
				 },
				 {
				   header: '자재코드',
				   name: 'mtrCd',
				   align: 'center',
				   sortable: true,
				   hidden: true
				 },
				 {
				   header: '자재명',
				   name: 'mtrNm',
				   align: 'left',
				   sortable: true,
				   validation: {
					   required:true
				   }
				 },
				 {
				   header: '단위',
				   name: 'unitNm',
				   align: 'center',
				   sortable: true
				 },
				 {
				   header: 'Lot No',
				   name: 'mtrLot',
				   align: 'center',
				   validation: {
					   required:true
				   },
				   editor: 'text',
				   sortable: true
				 },
				 {
				   header: '재고수량',
				   name: 'stckCnt',
				   align: 'right',
				   sortable: true
				 },
				 {
				   header: '정산량',
				   name: 'calAmt',
				   formatter({value}){
					   if(value != null){
					   	return format(value);
					   } else{
					   	return 0;
					   }
				   },
				   validation: {
					   dataType: 'number',
					   required:true
				   },
				   align: 'right',
				   editor: 'text',
				   sortable: true
				 },
				 {
				   header: '비고',
				   name: 'cmt',
				   align: 'left',
				   sortable: true,
				   editor: 'text'
				 },
				 {
				   header: '정산구분',
				   name: 'calSect',
				   hidden: true
				 },
				 {
				   header: '단위',
				   name: 'unit',
				   hidden: true
				 },
				 {
				   header: '관리수량',
				   name: 'mngAmt',
				   hidden: true
				 },
				 {
				   header: '등록자',
				   name: 'empNo',
				   hidden: true
				 }
				],
				summary : {
					height: 40,
					position: 'bottom',
					columnContent: {
						mtrLot: {
			                template(summary) {
			        			return '합 계';
			                } 
			            },	
			            stckCnt: {
			                template(summary) {
			        			var sumResult = (summary.sum);
			        			return format(sumResult);
			                } 
			            },
			            calAmt: {
			                template(summary) {
			        			var sumResult = (summary.sum);
			        			return format(sumResult);
			                } 
			            }
					}
				}
	});
//---------mainGrid 끝---------


//---------mainGrid row갯수 파악---------
mainGrid.on('onGridUpdated', function(ev) {
	rown = mainGrid.getRowCount();
});
//---------mainGrid row갯수 파악 끝---------


//---------mainGrid LOT번호 입력 alert---------
mainGrid.on('editingStart', function(ev) {
	if(rown <= rowk){
		if(ev.columnName == "mtrLot"){
			$('#ui-id-2').html('자재별 LOT정보');
			if(mainGrid.getValue(ev.rowKey, 'mtrNm') == null || mainGrid.getValue(ev.rowKey, 'mtrNm') == ''){
				alert("자재를 선택해 주세요.")
				ev.stop();
			}else if(mainGrid.getValue(ev.rowKey, 'calSectNm') == null || mainGrid.getValue(ev.rowKey, 'calSectNm') == ''){
				alert("정산 구분을 입력해 주세요.")
				ev.stop();
			}else{
				 let row = mainGrid.getRow(ev.rowKey);
				 document.getElementById('mStartDate').value = lastWeek();
				 document.getElementById('mEndDate').value = today();
				 lotDialog.dialog("open");
				 document.getElementById('mDitemCode').value = row.mtrCd
				 document.getElementById('mDitemCodeNm').value = row.mtrNm
				 document.getElementById('mUnitNm').value = row.unitNm
				 document.getElementById('mCalSect').value = row.calSect
				 lotGrid.readData(1,row,true);
				 lotGrid.refreshLayout();
				 ev.stop();
			}
		} else if(ev.columnName == 'calAmt' && mainGrid.getValue(ev.rowKey,'mtrLot') == ""){
			alert("Lot 번호를 입력해 주세요.")
			ev.stop();
		}
	} else{
		ev.stop();
	}
});
//---------mainGrid LOT번호 입력 alert 끝---------


//---------mainGrid 정산구분 입력하면 코드도 같이입력 & 출고정산량 validation---------
mainGrid.on('editingFinish', function(ev) {
	if(ev.columnName == 'calSectNm'){
		if(mainGrid.getValue(ev.rowKey,'calSectNm') == '입고정산'){
			mainGrid.setValue(ev.rowKey,'calSect','MTR_CAL001')
		}else if(mainGrid.getValue(ev.rowKey,'calSectNm') == '출고정산'){
			mainGrid.setValue(ev.rowKey,'calSect','MTR_CAL002')
		}
	};
	if(ev.columnName == 'calAmt'){
		if(mainGrid.getValue(ev.rowKey,'calSectNm') == '출고정산'){
			if(mainGrid.getValue(ev.rowKey,'calAmt')*1 > mainGrid.getValue(ev.rowKey,'stckCnt')*1){
				alert("출고정산량이 현재고보다 많습니다.")
				mainGrid.blur();
				mainGrid.setValue(ev.rowKey,'calAmt',mainGrid.getValue(ev.rowKey,'calAmt'));
			}
		}
	};
	mainGrid.refreshLayout();
});
//---------mainGrid 정산구분 입력하면 코드도 같이입력 & 출고정산량 validation 끝---------


//---------mainGrid 기존의 데이터 수정불가---------
mainGrid.on('dblclick',function(ev){
	rowk = ev.rowKey
	if(rown <= rowk){
		if(ev.columnName == "mtrNm"){
			mMtr();
			$('#ui-id-1').html('자재 검색');
		}
	} else {
		alert("기존의 정산 내역은 수정이 불가능합니다.")
	}
});
//---------mainGrid 기존의 데이터 수정불가 끝---------


//---------숫자데이터 구분자주는 기능---------
function format(value){
	value = value * 1;
	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
};
//---------숫자데이터 구분자주는 기능 끝---------


//---------모달 설정---------
let dialog;
dialog = $( "#dialog-form" ).dialog({
	autoOpen : false,
	modal : true,
	resizable: false,
	height: "auto",
	width: 600
});
//---------모달 설정 끝---------


//---------자재검색모달 row더블클릭 이벤트---------
function getModalMtr(param){
	dialog.dialog("close");
	if(rowk >= 0){
		mainGrid.blur();
		mainGrid.setValue(rowk, "mtrCd", param.mtrCd, false);
		mainGrid.setValue(rowk, "mtrNm", param.mtrNm, false);
		mainGrid.setValue(rowk, "unitNm", param.unitNm, false);
		mainGrid.setValue(rowk, "unit", param.unit, false);
		rowk = -1;
	} else {
		$('#ditemCode').val(param.mtrCd);
		$('#ditemCodeNm').val(param.mtrNm);
	}
};
//---------자재검색모달 row더블클릭 이벤트 끝---------


//---------lot모달 설정---------
let lotDialog = $( "#dialog-lot" ).dialog({
	autoOpen : false,
	modal : true,
	resizable: false,
	height: "auto",
	width: 800,
	buttons:{
			"확인":()=>{
			let rows = lotGrid.getCheckedRows();
			let calSect = mainGrid.getValue(rowk, 'calSect');
			let calSectNm = mainGrid.getValue(rowk, 'calSectNm');
			mainGrid.blur();
			for(row of rows){
				row.calDate = today()
				row.calSect = calSect
				row.calSectNm = calSectNm
				row.calAmt = row.stckCnt
			}
			mainGrid.setValue(rowk, 'mtrLot', rows[0].mtrLot)
			mainGrid.setValue(rowk, 'stckCnt', rows[0].stckCnt)
			mainGrid.setValue(rowk, 'calAmt', rows[0].calAmt)
			rows.splice(0,1);
			
			for(let i=0; i<rows.length; i++){
				mainGrid.appendRow({},{focus:true});
				mainGrid.setRow(mainGrid.getRowCount()-1,rows[i]);
				//mainGrid.setRow(rowk+i,rows[i]);
			}
			mainGrid.uncheckAll();
			lotDialog.dialog("close");
		}
	}
});
//---------lot모달 설정 끝---------


//---------lotGrid---------
let lotDataSource = {
	api: {
		readData: { url: './mtrLotModal',method: 'POST'}
	},
	contentType: 'application/json',
	initialRequest: false
};

let lotGrid = new Grid({
el : document.getElementById('dialog-lot'),
data : lotDataSource,
scrollX : false,
scrollY : true,
bodyHeight: 400,
rowHeaders : [ 'checkbox'],
columns : [ 
			{
				header: '입고번호',
				name: 'inNo',
				align: 'center'
			},
			{
				header: 'Lot No',
				name: 'mtrLot',
				align: 'center'
			},
			{
				header: '홀딩수량',
				name: 'hldCnt',
				align: 'right'
			},
			{
				header: '재고수량',
				name: 'stckCnt',
				align: 'right'
			},
			{
				header: '정산일자',
				name: 'calDate',
				hidden: true
			},
			{
				header: '자재코드',
				name: 'mtrCd',
				hidden: true
			},
			{
				header: '자재명',
				name: 'mtrNm',
				hidden: true
			},
			{
				header: '단위',
				name: 'unitNm',
				hidden: true
			},
			{
				header: '단위코드',
				name: 'unit',
				hidden: true
			},
			{
				header: '정산량',
				name: 'calAmt',
				hidden: true
			},
			{
				header: '정산구분',
				name: 'calSectNm',
				hidden: true
			}
			]
});
//---------lotGrid 끝---------


//***************************************************************************************************
//---------lotGrid (mainGrid에 있는 데이터 제거)---------
lotGrid.on('onGridUpdated', ev => {
	let datas = mainGrid.getData();
	let rows = lotGrid.getData();
		for(i=rown; i<mainGrid.getRowCount(); i++){
			for(row of rows){
				if(datas[i].mtrLot == row.mtrLot){
					lotGrid.removeRow(row.rowKey)
				}
			}
		}
});
//---------lotGrid (mainGrid에 있는 데이터 제거) 끝---------


//---------lotGrid 수정불가 컬럼 alert---------
lotGrid.on('dblclick',function(ev){
	if(ev.columnName == "inNo" || ev.columnName == "mtrLot" || ev.columnName == "hldCnt" || ev.columnName == "stckCnt"){
		alert("변경할 수 없는 코드 입니다.")
	}
});
//---------lotGrid 수정불가 컬럼 alert 끝---------


//---------조회버튼---------
btnFind.addEventListener("click", function(){
   let param= $("#frm").serializeObject();
   mainGrid.readData(1,param,true);
});
//---------조회버튼 끝---------


//---------저장버튼---------
btnSave.addEventListener("click", function(){
 	rowk = mainGrid.getRowCount();
    let checked = mainGrid.getCheckedRows();
     for(i=0; i<rowk; i++) {
        if(mainGrid.getRow(i).calSectNm == '') {
           alert("정산구분은 필수입력칸입니다!!");
           return;
        } else if(mainGrid.getRow(i).mtrNm == '') {
           alert("자재명은 필수입력칸입니다!!");
           return;
        } else if(mainGrid.getRow(i).mtrLot == '') {
           alert("LotNo는 필수입력칸입니다!!");
           return;
        } else if(mainGrid.getRow(i).calAmt == 0) {
           alert("정산량은 필수입력칸입니다!!");
           return;
        }
     }
	mainGrid.blur();
	mainGrid.request('createData');

	mainGrid.clear();
    mainGrid.resetData(checked);
    
	
	mainGrid.focus(mainGrid.getRowCount()-1,'calSectNm')
});
//---------저장버튼 끝---------


//---------추가버튼---------
btnAdd.addEventListener("click", function(){
	mainGrid.appendRow({},{focus:true});
	mainGrid.setValue(mainGrid.getRowCount()-1, 'calDate', today())
});
//---------추가버튼 끝---------


//---------삭제버튼---------
btnDel.addEventListener("click", function(){
	let param= $("#frm").serializeObject();
	mainGrid.removeCheckedRows(true);
	mainGrid.request('deleteData');
	setTimeout(function(){
		mainGrid.readData(1,param,true);
	},100);
});
//---------삭제버튼 끝---------


//---------자재검색버튼---------
btnMtrCd.addEventListener("click", function(){
	mMtr();
	$('#ui-id-1').html('자재 검색');
});
//---------자재검색버튼 끝---------


//---------lot 검색버튼---------
btnFindLot.addEventListener("click", function(){
	document.getElementById('mDitemCode').disabled = false;
   let param= $("#mFrm").serializeObject();
   lotGrid.readData(1,param,true);
	document.getElementById('mDitemCode').disabled = true;
});
//---------lot 검색버튼 끝---------
</script>
</body>
</html>