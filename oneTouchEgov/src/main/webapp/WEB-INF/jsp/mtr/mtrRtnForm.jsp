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
hr{
	margin-top: -20px;
}
.rowdiv{
	margin-bottom: 10px !important;
}
.bascard1{
	height:167px;
}
</style>
<body>

<div class="content-wrapper">
	<div class="row">
		<div class="col-md-12 grid-margin">
			<div class="row">
				<div class="col-12 col-xl-8 mb-4 mb-xl-0">
					<h3 class="font-weight-bold page-title">반품자재관리</h3>
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
							<label class="labeltext">발주일자</label>
							<input type="text" id="startDate" name="startDate" class="datepicker jquerydtpicker"> 
							<label> ~ </label> 
							<input type="text" id="endDate" name="endDate" class="datepicker jquerydtpicker">
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">입고업체코드</label>
							<input id="compCd" name="compCd" class="inputtext" readonly>
							<button type="button" id="btnInCom" class="btn btn-primary mr-2 minibtn" onclick="inComList()"><i class="icon-search"></i></button>
							<label class="labeltext colline2">입고업체명</label>
							<input id="compNm" name="compNm" class="inputtext" readonly>
						</div>
						
						<span class="rowdiv">
							<label class="labeltext">자재코드</label>
							<input type="text" id="ditemCode" name="ditemCode" class="inputtext" readonly>
							<button type="button" id="btnMtrCd" class="btn btn-primary mr-2 minibtn" ><i class="icon-search"></i></button>
							<label class="labeltext colline2">자재명</label>
							<input type="text" id="ditemCodeNm" name="ditemCodeNm" class="inputtext" readonly>
						</span>
						
						<span class="floatright">
							<button type="button" id="btnFind" class="btn btn-primary mr-2 newalign">반품대상조회</button>
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
</div>


	<!-- <div class="container">
		<h3>자재반품 관리</h3>
		<hr>
		<form id="frm" method="post">
			<div>
				<div>
					<label>발주일자</label> <input type="Date" id="startDate" name="startDate">&nbsp; 
					<label> ~ </label>&nbsp; 
					<input type="Date" id="endDate" name="endDate">
				</div>
				<div>
					<label>입고업체</label> <input type="text" id="compCd" name="compCd">
					<button type="button" id="btnInCom">ㅇ</button>&nbsp; 
					<label>입고업체명</label> 
					<input type="text" id="compNm" name="compNm" disabled="disabled">
				</div>
				<div>
					<label>자재코드</label> <input type="text" id="ditemCode" name="ditemCode">
					<button type="button" id="btnMtrCd">ㅇ</button>&nbsp;
					 <label>자재명</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					 <input type="text" id="ditemCodeNm" name="ditemCodeNm" disabled="disabled">
				</div>
			</div>
		</form>
		<div align="right">
			<button type="button" id="btnFind">반품대상조회</button>
			<button type="button" id="btnSave">저장</button>
		</div>
		<hr>
	</div>
	<div id="grid"></div>
	<div id="dialog-form"></div> -->

<script type="text/javascript">
let rowk = -1;
let datas = [];

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
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
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
    /*     $('#startDate').datepicker('setDate', '-1W'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)     
    $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  */      
});
//---------Jquery datepicker 끝---------


//---------mainGrid---------
const dataSource = {
	api: {
		readData: { url: './mtrRtnForm', method: 'POST' }
		//modifyData: { url: './mtrRtnModify', method: 'POST'}
	},
	contentType: 'application/json',
	initialRequest: false
};

var mainGrid = new Grid({
     el : document.getElementById('grid'),
     data : dataSource,
     scrollX : false,
     scrollY : true,
     bodyHeight: 477,
     minBodyHeight: 477,
     rowHeaders : [ 'checkbox'],
     columns : [
				{
				header: '발주번호',
				name: 'ordNo',
				hidden: true
				},
				{
				header: '발주일자',
				name: 'ordDate',
				align: 'center',
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
				sortable: true
				},
				{
				header: '단위',
				name: 'unit',
				align: 'center',
				sortable: true
				},
				{
				header: '업체',
				name: 'compNm',
				align: 'left',
				sortable: true
				},
				{
				header: '발주량',
				name: 'ordAmt',
				align: 'right',
				sortable: true
				},
				{
				header: '입고량',
				name: 'inAmt',
				align: 'right',
				sortable: true
				},
				{
				header: '불량량',
				name: 'fltAmt',
				align: 'right',
				sortable: true
				},
				{
				header: '반품량',
				name: 'rtnAmt',
				align: 'right',
				editor: 'text',
				 validation: {
					   required:true
				   },
				formatter({value}){
					   if(value != null){
					   	return format(value);
					   } else{
					   	return 0;
					   }
			   	},
				sortable: true
				},	
				{
				header: '반품사유',
				name: 'cmt',
				align: 'left',
				editor: 'text'
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
						compNm: {
								template(summary) {
									return '합 계';
								} 
						},
						ordAmt: {
							template(summary) {
								var sumResult = (summary.sum);
								return format(sumResult);
							}
						},
						inAmt: {
							template(summary) {
								var sumResult = (summary.sum);
								return format(sumResult);
							}
						},
						fltAmt: {
							template(summary) {
								var sumResult = (summary.sum);
								return format(sumResult);
							}
						},
						rtnAmt: {
								template(summary) {
									var sumResult = (summary.sum);
									return format(sumResult);
								}
						}
					}
				}
});
//---------mainGrid 끝---------


//---------mainGrid 수정불가 alert---------
mainGrid.on('dblclick',function(ev){
	if(ev.columnName == "ordDate" ||
		ev.columnName == "compNm" || 
		ev.columnName == "mtrNm" || 
		ev.columnName == "unit" ||
		ev.columnName == "mtrCd" ||
		ev.columnName == "ordAmt" ||
		ev.columnName == "inAmt" ||
		ev.columnName == "fltAmt"
		){
		alert("변경할 수 없는 코드 입니다.")
	}
});
//---------mainGrid 수정불가 alert 끝---------


//---------mainGrid 반품량 validation---------
mainGrid.on('editingFinish',(ev)=>{
	if(ev.columnName == 'rtnAmt' 
		&& mainGrid.getValue(ev.rowKey,'rtnAmt') > (mainGrid.getValue(ev.rowKey,'ordAmt') - mainGrid.getValue(ev.rowKey,'inAmt'))){
		ev.stop();
		alert("반품량이 너무 많습니다.")
	}
});
//---------mainGrid 반품량 validation 끝---------


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
	width: 500
});
//---------모달 설정 끝---------


//---------업체검색모달 row더블클릭 이벤트---------
function getModalBas(param){
	$('#compCd').val(param.dtlCd);
	$('#compNm').val(param.dtlNm);
	dialog.dialog("close");
};
//---------업체검색모달 row더블클릭 이벤트 끝---------
		
		
//---------업체검색버튼---------
btnInCom.addEventListener("click", function(){
	mBas('MTR_COM');
	$('#ui-id-1').html('업체 검색');
});
//---------업체검색버튼 끝---------


//---------자재검색모달 row더블클릭 이벤트---------
function getModalMtr(param){
	dialog.dialog("close");
	if(rowk >= 0){
		mainGrid.blur();
		mainGrid.setValue(rowk, "mtrCd", param.mtrCd, false);
		mainGrid.setValue(rowk, "mtrNm", param.mtrNm, false);
		mainGrid.setValue(rowk, "unit", param.unit, false);
		mainGrid.setValue(rowk, "compNm", param.compNm, false);
		mainGrid.setValue(rowk, "mngAmt", param.mngAmt, false);
		rowk = -1;
	} else {
		$('#ditemCode').val(param.mtrCd);
		$('#ditemCodeNm').val(param.mtrNm);
	}
};
//---------자재검색모달 row더블클릭 이벤트 끝---------


//---------자재검색버튼---------
btnMtrCd.addEventListener("click", function(){
	mMtr();
	$('#ui-id-1').html('자재 검색');
});
//---------자재검색버튼 끝---------


//---------조회버튼---------
btnFind.addEventListener("click", function(){
   let param= $("#frm").serializeObject();
   mainGrid.readData(1,param,true);
});
//---------조회버튼 끝---------


//---------조회버튼 끝---------
function mod(){
	let modify={};
	modify.updatedRows = datas
	fetch('mtrRtnModify',{
		method:'POST',
		headers:{
			"Content-Type": "application/json"
		},
		body:JSON.stringify(modify)
	})
}
//---------조회버튼 끝---------

//---------저장버튼---------
btnSave.addEventListener("click", function(){
	datas=[];
	for(data of mainGrid.getCheckedRows()){
		if(data.rtnAmt != ""){
			datas.push(data);
		}
	}
	if(datas.length != 0){
		if(confirm(datas.length + "건의 데이터를 처리하겠습니까?") == true){
			mod();
			mainGrid.blur();
			mainGrid.clear();
			mainGrid.resetData(datas);
			mainGrid.uncheckAll();
		} else {
			mainGrid.uncheckAll();
			return;
		}
	}else if(datas.length == 0){
		alert("저장할 데이터가 없습니다.")
		return;
	}
});
//---------저장버튼 끝---------
</script>
</body>
</html>