<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="${path}/resources/js/modal.js"></script>

</head>
<style type="text/css">
.tui-grid-cell-summary{
	text-align: right;
}
/* .block{
	display: block;
	flaot: right;
} */

.labeltext{
	width: 100px !important;
}
.colline2{
	margin-left: 60px;
	width: 100px !important;
}
</style>
<body>
<div class="content-wrapper">
	<div class="row">
		<div class="col-md-12 grid-margin">
			<div class="row">
				<div class="col-12 col-xl-8 mb-4 mb-xl-0">
					<h3 class="font-weight-bold page-title">자재입고관리</h3>
				</div>
			</div>
		</div>
	</div>
	<div align="right"> 
		<button type="button" id="btnOrdFind" class="btn btn-primary newalign">발주내역조회</button>
	</div> 
	
	<div class="row">
		<div class="col-md-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">조회조건</h4>
					<form id="frm" method="post">
						
						<div class="rowdiv">
							<span>
								<label class="schCondLabel labeltext">해당일자</label>
								<input type="Date" id="startDate" name="startDate" class="datepicker"> 
								<label> ~ </label> 
								<input type="Date" id="endDate" name="endDate" class="datepicker">
							</span>
						</div>
						
						<div class="rowdiv">
							<label class="labeltext">업체코드&nbsp;</label>
							<input type="text" id="compCd" name="compCd" class="inputtext">
							<button type="button" id="btnInCom" class="btn btn-primary mr-2 minibtn" onclick="inComList()" ><i class="icon-search"></i></button>
					
							<label class="labeltext colline2">입고업체명&nbsp;</label>
							<input id="compNm" name="compNm" disabled="disabled" class="inputtext">
						</div>
						
						<span class="rowdiv">
							<label class="labeltext">자재코드&nbsp;</label>
							<input type="text" id="ditemCode" name="ditemCode" class="inputtext">
							<button type="button" id="btnMtrCd" class="btn btn-primary mr-2 minibtn"><i class="icon-search"></i></button>
							
							<label class="labeltext colline2">자재명&nbsp;</label>
							<input type="text" id="ditemCodeNm" name="ditemCodeNm" disabled="disabled" class="inputtext">
						</span>
						
						<span>
							<button type="button" id="btnFind" class="btn btn-primary mr-2 floatrightbtn">조회</button>
						</span>
						
						
					</form>
				</div>
			</div>
		</div>
	</div>
		
	<span class="floatright">
		<button type="button" id='btnAdd' class="btn btn-main newalign">추가</button>
		<button	type="button" id='btnDel' class="btn btn-main newalign">삭제</button>
		<button type="button" id='btnSave' class="btn btn-primary newalign">저장</button> 
	</span>
	<br><br>
	<hr>
	<div id="grid"></div>
	<div id="dialog-form"></div>
	<div id="dialog-ord"></div>
	<div id="dialog-lot"></div>
			
</div>



	<!-- <div class="container">
		<h3>자재입고 조회</h3>
		<hr>
		<form id="frm" method="post">
			<div>
				<div>
					<label>해당일자</label>
					<input type="Date" id="startDate" name="startDate">&nbsp;
					<label> ~ </label>&nbsp;
					<input type="Date" id="endDate" name="endDate">
				</div>
				<div>
					<label>업체코드</label>
					<input type="text" id="compCd" name="compCd">
					<button type="button" id="btnInCom">ㅇ</button>&nbsp;
					<label>입고업체명</label>
					<input type="text" id="compNm" name="compNm" disabled="disabled">
				</div>
				<div>
					<label>자재코드</label>
					<input type="text" id="ditemCode" name="ditemCode">
					<button type="button" id="btnMtrCd">ㅇ</button>&nbsp;
					<label>자재명</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="ditemCodeNm" name="ditemCodeNm" disabled="disabled">
				</div>
			</div>
		</form>
		<div align="right">
			<button type="button" id="btnFind">조회</button>
		</div>
		<hr>
	</div>
<div id="grid"></div>
<div id="dialog-form"></div> -->

<script type="text/javascript">
toastr.options = {
	       "closeButton": true,
	       "debug": false,
	       "newestOnTop": false,
	       "progressBar": true,
	       "positionClass": "toast-top-center",
	       "preventDuplicates": false,
	       "onclick": null,
	       "showDuration": "3",
	       "hideDuration": "100",
	       "timeOut": "1500",
	       "extendedTimeOut": "1000",
	       "showEasing": "swing",
	       "hideEasing": "linear",
	       "showMethod": "fadeIn",
	       "hideMethod": "fadeOut",
	       "tapToDismiss": false,
	       "closeHtml": "확인"
	     }
var Grid = tui.Grid;
Grid.applyTheme('striped', {
     cell: {
       header: {
         background: '#eef'
       },
       evenRow: {
         background: '#fee'
       }
     },
   });
const dataSource = {
		  api: {
		    readData: { url: './mtrInList', method: 'POST' }
		  },
		  contentType: 'application/json'
		};

var grid = new Grid({
     el : document.getElementById('grid'),
     data : dataSource,  // 컬럼명과 data명이 같다면 생략가능 
     columns : [
				 {
				   header: '입고일자',
				   name: 'inDate',
				   align: 'center',
				   sortable: true
				 },
				 {
				   header: '입고번호',
				   name: 'inNo',
				   align: 'center',
				   sortable: true
				 },
				 {
				   header: '자재코드',
				   name: 'mtrCd',
				   align: 'center',
				   sortable: true
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
				   header: '발주번호',
				   name: 'ordNo',
				   align: 'center',
				   sortable: true
				 },
				 {
				   header: '불량량',
				   name: 'fltAmt',
				   align: 'right',
				   formatter({value}){
					   return format(value);
				   },
				   sortable: true
				 },
				 {
				   header: '입고량',
				   name: 'inAmt',
				   align: 'right',
				   formatter({value}){
					   return format(value);
				   },
				   sortable: true
				 },
				 {
				   header: '단가',
				   name: 'unitCost',
				   align: 'right',
				   formatter({value}){
					   return format(value);
				   },
				   sortable: true
				 },
				 {
				   header: '총금액',
				   name: 'totCost',
				   align: 'right',
				   formatter({value}){
					   return format(value);
				   },
				   sortable: true
				 }
				],
				summary : {
					
					height: 40,
				   	position: 'bottom',
				   	columnContent: {
				   		ordNo: {
			                template(summary) {
			        			return '합 계';
			                } 
			            },	
			            fltAmt: {
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
			            unitCost: {
			                template(summary){
			        			return "MIN: "+summary.min+"<br>"+"MAX: "+summary.max;
			                } 
			            },
			            totCost: {
			                template(summary) {
			        			var sumResult = (summary.sum);
			        			return format(sumResult);
			                } 
			            }
					}
				}
   });
   
let dialog;
dialog = $( "#dialog-form" ).dialog({
	autoOpen : false,
	modal : true,
	resizable: false,
	height: "auto",
	width: 500
});

function format(value){
	value = value * 1;
	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
grid.on('dblclick',(ev)=>{
	toastr["error"]("변경할 수 없습니다.", "경고입니다.")
})

//조회버튼
btnFind.addEventListener("click", function(){
   let a= $("#frm").serializeObject();
   grid.readData(1,a,true);
})
//업체검색모달 row더블클릭 이벤트
function getModalBas(param){
			$('#compCd').val(param.dtlCd);
			$('#compNm').val(param.dtlNm);
			dialog.dialog("close");
		};
		
//자재검색모달 row더블클릭 이벤트
function getModalMtr(param){
	dialog.dialog("close");
	$('#ditemCode').val(param.mtrCd);
	$('#ditemCodeNm').val(param.mtrNm);
};
//업체검색버튼
btnInCom.addEventListener("click", function(){
	mBas('MTR_COM');
	$('#ui-id-1').html('업체 검색');
});
//자재검색버튼
btnMtrCd.addEventListener("click", function(){
	mMtr();
	$('#ui-id-1').html('자재 검색');
});


</script>
</body>
</html>