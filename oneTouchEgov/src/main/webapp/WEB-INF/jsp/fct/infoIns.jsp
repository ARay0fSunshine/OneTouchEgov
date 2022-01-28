<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비등록페이지</title>
<!-- 토스트그리드 cdn -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css"> -->
<!-- 토스트 그리드 위에 데이트피커 가 선언되어야 작동이 된다 (순서가중요) -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>

<!-- 토스트그리드 cdn -->
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="${path}/resources/js/modal.js"></script>
<style>
td>input {
	width: 120px;
	height: 30px;
	font-size: 15px;
}

td {
	font-size: 13px;
}
</style>

</head>
<body>
	<div class="row">
		<div class="col-3" style="border-right: 1px solid gray;">
			<!-- <button type="button" id='LinebtnFind'>라인조회</button> -->
			<button type="button" id='LinebtnAdd' onclick=LineAdd()>추가</button>
			<button type="button" id='LinebtnDel' onclick=LineDel()>삭제</button>
			<button type="button" id='LinebtnEdit' onclick=LineUpt()>수정</button>
			<button type="button" id='LinebtnClear' onclick=LineClear()>초기화</button>
			<form id="lineForm" method="post" style="margin-bottom: 25px;">
				<div class="row" style= " /* border-top: 2px solid black; */ padding: 5px;">
					<div class="col-12" style="margin-top: 30px; margin-bottom: 30px;">
						<table>
							<tr>
								<td>라인</td>
								<td><input type="text" id="lineinput" name="lineNO"
									value="" style="text-transform: uppercase;" /></td>
							</tr>
							<tr>
								<td>총생산량</td>
								<td><input type="number" id="totPdtAmt" name="totPdtAmt"
									value="" /></td>
							</tr>
							<tr>
								<td>UPH생산량</td>
								<td><input type="number" id="uphPdtAmt" name="uphPdtAmt"
									value="" /></td>
							</tr>
							<tr>
								<td>사원</td>
								<td><input type="text" id="empNo" name="empNo" value="" /></td>
							</tr>
							<tr>
								<td>사용여부</td>
								<td><input type="checkbox" id="useYn" name="useYn" value="N" /></td>
							</tr>
						</table>
					</div>
				</div>

			</form>
			<div style=" margin-left: 40px;"  id="lineGrid"></div>
		</div>
		<div class="col-9">
			<div>
				<!-- <button type="button" id='btnFind'>조회</button> -->
				<button type="button" id='btnAdd'>추가</button>
				<button type="button" id='btnDel'>삭제</button>
				<button type="button" id='btnSave'>저장</button>
				<button type="button" id='btnEdit'>수정</button>
			</div>
		<form id="infoFrm"  onsubmit="return false" method="post" enctype="multipart/form-data" >
			<div class="row" style="/* border-top: 2px solid black; */ padding: 5px;">
				<div class="col-5" style="margin-top: 30px; margin-bottom:10px;">
						<table>
							<tr>
								<td>설비코드</td>
								<td><input type="text" id="fctCd" name="fctCd" value="" list="fctCd-options" onkeyup="enterkey()" />
								<datalist id="fctCd-options"></datalist>
								</td>
								<td>모델명</td>
								<td><input type="text" id="fctModel" name="fctModel"
									value="" /></td>
								<!-- <td>사용여부</td>
                        <td><input type="checkbox" id="useYn" name="useYn" checked="" /></td> -->
							</tr>
							<tr>
								<td>설비규격</td>
								<td><input type="text" id="fctStd" name="fctStd" value="" /></td>
								<td>라인번호</td>
								<td><select id="lineNO" name="lineNO" ></select></td>
								<td>공정</td>
								<td><input type="text" id="prcCd" name="prcCd" value="" /></td>

							</tr>
							<tr>
								<td>입고일</td>
								<td><input type="date" id="inDate" name="inDate" value="" /></td>
								<td>구매금액</td>
								<td><input type="text" id="purchCost" name="purchCost"
									onkeyup="inputNumberFormat(this)" value="" />원</td>
								<td>회사코드</td>
								<td><input type="text" id="compCd" name="compCd" value="" /></td>
							</tr>
							<tr>
								<!-- <td>이미지</td>
                        <td><input type="text" id="FctImg" name="FctImg" value="" /></td> -->
								<!-- <td>시간당 생산량</td>
                        <td><input type="text" id="uphPdtAmt" name="uphPdtAmt"
                           value="" /></td> -->
								<td>담당자</td>
								<td><input type="text" id="empNo" name="empNo" value="" /></td>
								<td>점검주기</td>
								<td><input type="number" id="chkProd" name="chkProd"
									value="" /></td>
								<td><select id="chkProdUnit" name="chkProdUnit">
										<option value="Y">년</option>
										<option value="M">달</option>
										<option value="W">주</option>
										<option value="D">일</option>
								</select></td>
								<td><input type="hidden" id="fctNm" name="fctNm" value="" /></td>
							</tr>
						</table>
						<div class="col-5">
							
							<div class='uploadDiv'>
								<td></td>
								<!-- <button id='uploadBtn'>Upload</button> -->
							</div>
							
				</div>
				<div style="margin-top: 53px; margin-left: 195px;">
					<form>
						<label>검색</label>
						<input type="text" id="checkfct" name="checkfct" value="" list="fctCd-options" />
						<datalist id="fctCd-options"></datalist>
						<button id="selectBtn" onclick=selectCheckFct()>조회</button>
					</form>
				</div>
			</div>
			<div class=col-4>
					<img src="../resources/img/logo.jpg" id="fctImges" style="width: 250px; height: 200px;">
					<input style="margin-bottom: 20px;" type="file" id="fctImgBtn" name="uploadFile" value="" multiple onchange="setThumbnail(event)" />
					<input type=hidden id="fctImg" value="">
				</div>
		</div>
	</form>
		<div id="dialog-form"></div>
		<div style = "margin-left:70px;">
			<div id="grid" ></div>
		</div>
	</div>
	<!-- row -->
	<div id="fctGubundialog-form" title="설비구분"></div>
	<script>
   let dialog; 
   let lineStatusVO = {};
   
   //설비업체 Modal start=========================================================================================
   dialog = $( "#dialog-form" ).dialog({   
      autoOpen : false,
      modal : true,
   });

   $("#compCd").on("click", function(){
      mBas('FCT_COM',event.target);
   });   
   function getModalBas(param, btn){ //모달에서 값을 선택했을 때 호출 나중에 주석 풀어서 사용
      console.log('getModalBas 메서드 출력')
      console.log(btn.id)
         if(btn.id == 'fctCd'){
            console.log('공정코드 메소드')
            $("#fctCd").val(param.dtlCd);
            $("#fctNm").val(param.dtlNm);
            console.log(param.dtlCd);
            dialog.dialog('close');
         }
         else if(btn.id == 'compCd'){
            console.log('회사코드 클릭하면 이쪽으로 옴 ')
            $("#compCd").val(param.dtlCd);
            dialog.dialog('close');
         }
      }
   //라인
   function getModalLine(param){ //모달에서 값을 선택했을 때 호출 나중에 주석 풀어서 사용
      console.log('getModalLine 메서드 출력')
      console.log(param.lineNO)
            $("#lineNO").val(param.lineNO);
            dialog.dialog('close');
   }
    

   
   //설비업체 Modal end=========================================================================================
   

   let targetId = [];
   let s = 'd';
   var Grid = tui.Grid;
   //테마옵션 (선언된 그리드 바로빝에 해주면되고 또는 jsp 파일로 만들어서 넣어도됨)
   Grid.applyTheme('clean', {   
        cell: {
           header: {
               background: '#4B49AC',
               text: '#fff'
           }
   		},
        row:{
        	hover:{
          	  background:'#F5F7FF'
            }
        }
      }
   );
   
   //th 영역
    let fctColumns = [
    {
    header: '설비코드',
    name: 'fctCd',
    editor: 'text'
  },
  {
    header: '설비명',
    name: 'fctNm',
    editor: 'text'
  },
  {
    header: '공정',
    name: 'prcCd',
    editor: 'text'
  },
  {
    header: '설비규격',
    name: 'fctStd',
    editor: 'text'
  },
  {
    header: '모델명',
    name: 'fctModel',
    editor: 'text'
  }/* ,
  {
    header: '회사코드',
    name: 'compCd'
  },
  {
    header: '사용목적',
    name: 'usePurp'
  } */,  
  {     
     //날짜(데이터피커) cdn 받아서 넣었다
     headet: '입고일',
     name: 'inDate',
     editor: 'datePicker'
  }/* ,
  {
    header: '구매금액',
    name: 'purchCost',
    editor: 'text'
  } */
  /* {
    header: '점검주기',
    name: 'chkProd',
    editor: 'text'
  },
  {
    header: '총생산량',
    name: 'totPdtAmt',
    editor: 'text'
  },
  {
    header: 'uph생산량',
    name: 'uphPdtAmt',
    editor: 'text'
  },
  {
    header: '사번',
    name: 'empNo',
    editor: 'text'
  } */
    ]
   
   
   	let data;
    let dataVO;
    let checkPrcCd = 'd';       //검색 조건을 사용하지 않지만 검색 메소드 매개변수에 vo가 있기 때문에 쓰레기 값을 넣어준다. 
    let vo={};               //map형식으로 보내주기 위해서 초기화 
    vo.checkPrcCd=checkPrcCd;   //vo에 키 값을 정해서 밸류 값을 넣어주는 초기화 
    let grid;
    let lineData;
    
    //그리드를 id 값안에다가 붙여넣어준다.
     fctGrid = new Grid({
        el: document.getElementById('grid'),
        data:data,  //이름이 같다면 생격가능
        columns:fctColumns,
        bodyHeight: 600,
       minBodyHeight: 600,
       width: 800
    });
    
    
  //th 영역
    let lineColumns = [
    {
    header: '라인',
    name: 'lineNO',
    editor: 'text'
  },
  {
	    header: '사용여부',
	    name: 'useYn',
	    editor: {
	     type: 'radio',
	     options:{
	    	 listItems:[
	    		 {text:'Y', value:'Y'},
	    		 {text:'N', value:'N'}
	    	 ]
	     }
		}
  },
		{
			header: '사원',
		    name: 'empNo',
		    editor: 'text'
	  	}    	
	  /* ,
  {
    header: '총생산량',
    name: 'totPdtAmt',
    editor: 'text'
  },
  {
    header: 'UPH생산량',
    name: 'uphPdtAmt',
    editor: 'text'
  }*/
    ]
 
  //그리드를 id 값안에다가 붙여넣어준다.
     LineGrid = new Grid({
        el: document.getElementById('lineGrid'),
        data:lineData,  //이름이 같다면 생격가능
        columns:lineColumns,
        bodyHeight: 600,
       minBodyHeight: 600,
       width:250
    });
      
      
      
      
       //ajax 요청
        
        $.ajax({
           url:'./list1',   //나중에 이거 대신에 컨트롤러 요청하면 됨 
           method: 'POST',
           data: JSON.stringify(vo),
           contentType: "application/json",
           async : false               //동기 = 절차적 
        }).done(function(datas){
             console.log('조회 테스트')
            console.log(datas)
            data = datas;
             fctGrid.resetData(data);
             fctGrid.refreshLayout();
             
          
        }) 
   fctGrid.on('click',(ev) =>{
      
      dataVO =fctGrid.getData()[ev.rowKey]; 
      //data[ev.rowKey];
      
      document.getElementById('fctCd').value = dataVO.fctCd;
      document.getElementById('fctNm').value = dataVO.fctNm;
      document.getElementById('prcCd').value = dataVO.prcCd;
      document.getElementById('fctStd').value = dataVO.fctStd;
      document.getElementById('fctModel').value = dataVO.fctModel;
      document.getElementById('compCd').value = dataVO.compCd;
      document.getElementById('inDate').value = dataVO.inDate;
      document.getElementById('purchCost').value = dataVO.purchCost;
      document.getElementById('chkProd').value = dataVO.chkProd;
      document.getElementById('fctImg').value = dataVO.fctImg;
      
      
      var fileCallPath = encodeURIComponent(dataVO.uploadPath+"/s_"+dataVO.fctImg);
      console.log('이미지 테스트')
      console.log(fileCallPath);
      if(dataVO.uploadPath == null){
    	  console.log('이미지 없음')
    	  document.getElementById('fctImges').setAttribute("src", '../resources/img/logo.jpg');
      }
      else{
		document.getElementById('fctImges').setAttribute("src", 'display?fileName='+fileCallPath);
		console.log('사진 경로 띄우기')
		console.log(dataVO.fctImg+dataVO.uploadPath)
      }
      
      //상세정보에 체크 박스 이벤트 걸기
     
   })
   
   //라인 그리드 클릭 이벤트 
   LineGrid.on('click',(ev) =>{
      let lineVO = LineGrid.getData()[ev.rowKey];
      //lineData[ev.rowKey];
      console.log('라인그리드 테스트')
      console.log(lineVO)
      document.getElementById('lineinput').value = lineVO.lineNO;
      document.getElementById('totPdtAmt').value = lineVO.totPdtAmt;
      document.getElementById('uphPdtAmt').value = lineVO.uphPdtAmt;
      document.getElementById('useYn').checked = (lineVO.useYn=='Y')?true:false;
      document.getElementById('useYn').value = lineVO.useYn;
      document.getElementById('empNo').value = lineVO.empNo;
      
      document.getElementById('useYn').addEventListener('click', function(event){
    	  if(lineVO.useYn == 'Y'){
	    	  alert("해당 라인에 포함되어 있는 설비를 먼저 등록해제 해주세요 ")
	    	  document.getElementById('useYn').checked = true;
	    	  
    	  }
      })
   })
    
   //라인 찾는 아작스 
   $.ajax({
      url : './LineSelect',
      method:'post',
      data: JSON.stringify(lineStatusVO),
	  contentType: "application/json",
      success : function(result){
         lineData = result;
         LineGrid.resetData(result);
         console.log('line출력')
         console.log(result)
      }
   });
   
    //클릭 이벤트 그리드
    fctGrid.on('check', (ev) => {
       
       vo = {fctCd:""};
       vo.fctCd = data[ev.rowKey].fctCd;
      console.log(vo)
      targetId.push(vo);
      
      console.log(targetId)
         
    })
      
            
       
    fctGrid.on('response', function(ev) {
          console.log(ev);
          fctGrid.resetOriginData()   //현재 데이터를 변경된 데이터로 확장한다. 
       })
       
       btnAdd.addEventListener("click", function(){
          fctGrid.appendRow({})
       })
       
       btnDel.addEventListener("click", function(){
          //삭제 아작스 처리
             $.ajax({
                url: "./deleteInfo",
                method: "POST",
                data: JSON.stringify(targetId),         //json을 string으로 바꿔줘야함 
                contentType:"application/json",         //넘겨주는 데이터가 json이라는 걸 알려주는 것 
                success:function(result){
                   console.log('성공')
                   fctGrid.resetData(result)
                   targetId.length = 0;
                }
          
             })
       })
       
        btnSave.addEventListener("click", function(){
           console.log('11111111111111')
           //console.log($('#infoFrm').serialize())
           
           let infoForm = document.getElementById('infoFrm')
           var formData = new FormData(infoForm);
           console.log(formData)
         
         
          //등록아작스 
           $.ajax({
                
                url: "./infoInsert",
                processData: false,
                contentType: false,
                method: "POST",
                data:formData,
                dataType:'Json',
                success:function(result){
                   console.log('성공')
                   fctGrid.resetData(result)
                }
             })
          //grid.request('modifyData');
       })//add버튼 
       
      
      //설비구분 Modal start=========================================================================================
      //let dialog; //가져가서 사용할 때는 주석 풀어서 사용(이미 있다면 let선언 빼주거나 아니면 dialog 이름 바꿔서 사용)
      
     /*  $("#fctCd").on("click", function(){
         console.log('설비코드 버튼 클릭')
         mBas('FCT_DIV',event.target);
      }) */
      $("#fctNm").on("click", function(){
         console.log('설비이름 버튼 클릭')
         mBas('FCT_DIV',event.target);
      })
   
      //설비구분 Modal end=========================================================================================
      
       //공정 Modal start=========================================================================================
      //let dialog; //가져가서 사용할 때는 주석 풀어서 사용(이미 있다면 let선언 빼주거나 아니면 dialog 이름 바꿔서 사용)
      //dialog = $( "#dialog-form" ).dialog({ //갸져가서 주석 풀어서 사용 이미 있으면 빼고해도 됨     //<div id="dialog-form" title="title"></div> 같이 가져갈 것
      //   autoOpen : false,
      //   modal : true,
      //});
      
      $("#prcCd").on("click", function(){
         mPrc();
      })
      //라인 input 클릭 이벤트 
       $("#lineNO").on("click", function(){
         /*mLine(lineStatusVO); */
      }) 
      
      function getModalPrc(param){//모달에서 값을 선택했을 때 호출
         //선택한 값 parameter받아서 각자 처리
         $("#prcCd").val(param.prcCd);
         console.log(param);
         dialog.dialog("close");
      }
      //공정 Modal end=========================================================================================
       
       
       /* btnFind.addEventListener("click", function(){
          //grid.;
          
       }) */ 
       //수정 아작스 
       btnEdit.addEventListener("click", function(){
          
         let infoForm = document.getElementById('infoFrm');
         let formData = new FormData(infoForm);
         console.log('업데이트')
         console.log(formData)
          $.ajax({
            url: "./Updateinfo",
            processData: false,
            contentType: false,
            method: "POST",
            data:formData,
            dataType:'Json',
            success:function(result){
               console.log('성공')
               //data = result;
               fctGrid.resetData(result)
            }
       
          })
       })
       //금액 천단위 구분 기호 함수
       function inputNumberFormat(obj) {
         obj.value = comma(uncomma(obj.value));
      }
       function comma(str) {
            str = String(str);
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        }

        function uncomma(str) {
            str = String(str);
            return str.replace(/[^\d]+/g, '');
        }
        //천단위 구분 기호 끝


       
   function setThumbnail(event) { 
      
      var reader = new FileReader(); 
      reader.onload = function(event) { 
         
         document.getElementById('fctImges').setAttribute("src", event.target.result); 
         
      }; 
      reader.readAsDataURL(event.target.files[0]); 
   }   // end setThumbnail
        
   var regex = new RegExp("(/*?)\.(exe|sh|zip|alz)$");
   var maxSize = 5242880;   //5MB
   var uploadResult = $(".uploadResult ul");
   
   //이미지파일 보여주기 
   function showUploadedFile(uploadResultArr){
      var str = "";
      
      $(uploadResultArr).each(function(i, obj){
         console.log(obj);
         if(!obj.image){
            str +="<li><img src='/resources/img/images.jpg'>"+obj.fileName+"</li>";
         }else{
            //str +="<li>"+ obj.fileName+"</li>";
            
            var fileCallPath = encodeURIComponent( obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
            
            str += "<li><img src='display?fileName="+fileCallPath+"'></li>";
         }
      });
      uploadResult.append(str)
   }
   
   console.log('uploadResult'+uploadResult)
   
   function checkExtension(fileName, fileSize){
      
      if(fileSize >= maxSize){
         alert("파일 사이즈 초과");
         return false;
      }
      
      if(regex.test(fileName)){
         alert("해당 종류의 파일은 업로드 할수 없습니다.");
         return false;
      }
      return true;
   }
   
   //라인 등록
   function LineAdd(){
	   let lineInput = $("#lineForm").serializeObject();
	   console.log('추가 버튼 클릭');
	   console.log(lineInput)
	   
	   //등록아작스 
          fetch('./LineInsert',{
        	  method:'POST',
        	  headers:{
  				"Content-Type": "application/json",
  			},
        	  body:JSON.stringify(lineInput)
          })
	   .then(response=> response.json())
	   .then(result=>{
		   console.log(result)
	   })
   }
   //라인삭제
	function LineDel(){
		let lineInput = $("#lineForm").serializeObject();
		console.log('삭제 버튼 클릭');
		console.log(lineInput)
		console.log(lineInput.useYn)
		
		if(lineInput.useYn == 'N' || lineInput.useYn == undefined ){
			console.log('n이거나 null 일때 ')
			 //라인 삭제 
	          fetch('./LineDelete',{
	        	  method:'POST',
	        	  headers:{
	  				"Content-Type": "application/json",
	  			},
	        	  body:JSON.stringify(lineInput)
	          })
		   .then(response=> response.json())
		   .then(result=>{
			   console.log(result)
			   alert(lineInput.lineNO+"라인이 삭제되었습니다");
			   LineGrid.resetData(result);
		   })
		}
		else if(lineInput.useYn == 'Y'){
			alert("해당 라인에 사용중인 설비를 먼저 등록해제 해주세요")
		}
	}
   //라인 input 초기화 
	function LineClear(){
		document.getElementById('lineinput').value = '';
		document.getElementById('totPdtAmt').value = '';
		document.getElementById('uphPdtAmt').value = '';
		document.getElementById('useYn').checked = false;
		document.getElementById('empNo').value = '';
   }
	
	document.getElementById('useYn').addEventListener('click',function(event){
		let checkValue = document.getElementById('useYn').checked;
		if(checkValue ==true){
			document.getElementById('useYn').value= 'Y';	
		}
		else{
			document.getElementById('useYn').value= 'N';
		}
		console.log(event.target.value)
		
		
	})
	
	//라인 수정 
	function LineUpt(){
		console.log('수정버튼 클릭 이벤트')
		let lineInput =$("#lineForm").serializeObject();
		console.log('폼태그 값 시리얼 라이즈')
		console.log(lineInput)
		fetch('./LineUpdate',{
			method:'POST',
			headers:{
				"Content-Type": "application/json",
			},
			body:JSON.stringify(lineInput)
		})
		.then(response=> response.json())
		.then(result=>{
			console.log('라인업데이트')
			console.log(result)
			LineGrid.reset(result)
		})
	}
	
	//라인번호 select 값 조회 
	function selectLine(){
		let fctLineChek= 'Y'; 
        lineStatusVO.fctLineChek = fctLineChek;
		$.ajax({
		      url : './LineSelect',
		      method:'post',
		      data: JSON.stringify(lineStatusVO),
		      contentType: "application/json",
		      success : function(result){
		    	  for(d of result){
		    	  	$('#lineNO').append("<option value="+d.lineNO+">"+d.lineNO+"</option>")
		    	  }
		      }
		   });
	}
	//설비코드를 검색 input에 list에 append해준다. 
	function checkFctList(){
		fetch('./selelctCheckFct')
		.then(response=>response.json())
		.then(result=>{
			for(let data of result){
				$('#fctCd-options').append("<option value="+data.fctCd+">"+data.fctNm+"</option>")
			}
		})
		
	}
	

	//엔터키 이벤트 막아주기 
	document.getElementById('fctCd').addEventListener('keydown', event=>{
			//event.preventDefault();
	})
	//엔터키 이벤트
	 function enterkey() {
		let code = document.getElementById('fctCd').value
		if (window.event.keyCode == 13) {
			for(d of fctGrid.getData()){
				if(d.fctCd == code  ){
					  document.getElementById('fctCd').value = d.fctCd;
				      document.getElementById('fctNm').value = d.fctNm;
				      document.getElementById('prcCd').value = d.prcCd;
				      document.getElementById('fctStd').value = d.fctStd;
				      document.getElementById('fctModel').value = d.fctModel;
				      document.getElementById('compCd').value = d.compCd;
				      document.getElementById('inDate').value = d.inDate;
				      document.getElementById('purchCost').value = d.purchCost;
				      document.getElementById('chkProd').value = d.chkProd;
				      document.getElementById('fctImg').value = d.fctImg;
				      var fileCallPath = encodeURIComponent(d.uploadPath+"/s_"+d.fctImg);
				      console.log('이미지 테스트')
				      console.log(fileCallPath);
				      if(d.uploadPath == null){
				    	  console.log('이미지 없음')
				    	  document.getElementById('fctImges').setAttribute("src", '../resources/img/logo.jpg');
				      }
				      else{
						document.getElementById('fctImges').setAttribute("src", 'display?fileName='+fileCallPath);
						console.log('사진 경로 띄우기')
						console.log(d.fctImg+d.uploadPath)
				      }
				      
							
				}
			}
			
      
     
			
		}
	}
	selectLine()		//라인코드 select option으로 넣어주기
	checkFctList()
	


</script>

</body>
</html>