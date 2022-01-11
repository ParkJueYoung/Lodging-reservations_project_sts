<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/css/admin/lodgingEnroll.css?asded">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>

</head>
<body>

	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>숙소 등록</span>
		</div>
		<div class="admin_content_main">
			<form action="/admin/lodgingEnroll" method="post" id="enrollForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>숙소 이름</label>
					</div>
					<div class="form_section_content">
						<input name="lodgingName">
						<span class="ck_warn lodgingName_warn">숙소 이름을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>임대인</label>
					</div>
					<div class="form_section_content">
						<input id="leaseName_input" readonly="readonly"> <input
							id="leaseId_input" name="leaseId" type="hidden">
						<button class="leaseId_btn" type="button" onclick="leaseId_add();">임대인 선택</button>
						<span class="ck_warn leaseId_warn">임대인을 선택해주세요</span>

					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>숙소 카테고리</label>
					</div>
					<div class="form_section_content">
						<div class="cate_wrap">
							<span>대분류</span>
							<select class="cate1">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>중분류</span>
							<select class="cate2">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>소분류</span>
							<select class="cate3" name="cateCode">
								<option selected value="none">선택</option>
							</select>
						</div>
						<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span> 
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>숙소 가격</label>
					</div>
					<div class="form_section_content">
						<input name="lodgingPrice" value="0">
						<span class="ck_warn lodgingPrice_warn">숙소 가격을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>숙소 재고</label>
					</div>
					<div class="form_section_content">
						<input name="lodgingStock" value="0">
						<span class="ck_warn lodgingStock_warn">숙소 재고를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>숙소 소개</label>
					</div>
					<div class="form_section_content">
						<textarea name="lodgingIntro" id="lodgingIntro_textarea"></textarea>
						<span class="ck_warn lodgingIntro_warn">숙소 소개를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>숙소 내용</label>
					</div>
					<div class="form_section_content">
						<textarea name="lodgingContents" id="lodgingContents_textarea"></textarea>
						<span class="ck_warn lodgingContents_warn">숙소 내용을 입력해주세요.</span>
					</div>
				</div>
				<div class = "form_section">
					<div class = "form_section_title">
						<label>숙소 이미지</label>
					</div>
					<div class = "form_section_content"></div>
					<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
					<div id = "uploadResult">
						
					</div>
				</div>
			</form>
			<div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
				<button id="enrollBtn" class="btn enroll_btn">등 록</button>
			</div>
		</div>
	</div>

	<%@include file="../includes/admin/footer.jsp"%>
	<script>
		
	let enrollForm = $("#enrollForm")
	
	/* 취소 버튼 */
	$("#cancelBtn").click(function(){
		
		location.href="/admin/lodgingList"
		
	});

	/* 상품 등록 버튼 */
	$("#enrollBtn").on("click",function(e){
		
		e.preventDefault();
		
		/* 체크 변수 */
		let lodgingNameCk = false;
		let leaseIdCk = false;
		let cateCodeCk = false;
		let priceCk = false;
		let stockCk = false;
		let introCk = false;
		let contentsCk = false;
		
		/* 체크 대상 변수 */
		let lodgingName = $("input[name='lodgingName']").val();
		let leaseId = $("input[name='leaseId']").val();
		let cateCode = $("select[name='cateCode']").val();
		let lodgingPrice = $("input[name='lodgingPrice']").val();
		let lodgingStock = $("input[name='lodgingStock']").val();
		let lodgingIntro = $(".lit p").html();
		let lodgingContents = $(".lct p").html();
		
		if(lodgingName){
			$(".lodgingName_warn").css('display','none');
			lodgingNameCk = true;
		} else {
			$(".lodgingName_warn").css('display','block');
			lodgingNameCk = false;
		}
		
		if(leaseId){
			$(".leaseId_warn").css('display','none');
			leaseIdCk = true;
		} else {
			$(".leaseId_warn").css('display','block');
			leaseIdCk = false;
		}
		
		if(cateCode != 'none'){
			$(".cateCode_warn").css('display','none');
			cateCodeCk = true;
		} else {
			$(".cateCode_warn").css('display','block');
			cateCodeCk = false;
		}	
		
		if(lodgingPrice != 0){
			$(".lodgingPrice_warn").css('display','none');
			priceCk = true;
		} else {
			$(".lodgingPrice_warn").css('display','block');
			priceCk = false;
		}	
		
		if(lodgingStock != 0){
			$(".lodgingStock_warn").css('display','none');
			stockCk = true;
		} else {
			$(".lodgingStock_warn").css('display','block');
			stockCk = false;
		}		
		
		if(lodgingIntro != '<br data-cke-filler="true">'){
			$(".lodgingIntro_warn").css('display','none');
			introCk = true;
		} else {
			$(".lodgingIntro_warn").css('display','block');
			introCk = false;
		}	
		
		if(lodgingContents != '<br data-cke-filler="true">'){
			$(".lodgingContents_warn").css('display','none');
			contentsCk = true;
		} else {
			$(".lodgingContents_warn").css('display','block');
			contentsCk = false;
		}
		
		if(lodgingNameCk && leaseIdCk && cateCodeCk && priceCk && stockCk && introCk && contentsCk ){
			//alert('통과');
			enrollForm.submit();
		} else {
			return false;
		}
		
	});
	
	// 숙소 소개
	ClassicEditor
	.create(document.querySelector('#lodgingIntro_textarea'))
	.catch(error=>{
			console.error(error);
		});
		
	// 숙소 목차 	
	ClassicEditor
	.create(document.querySelector('#lodgingContents_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
	// 카테고리
	let cateList = JSON.parse('${cateList}');

	let cate1Array = new Array();
	let cate2Array = new Array();
	let cate3Array = new Array();
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	let cate3Obj = new Object();
	
	let cateSelect1 = $(".cate1");		
	let cateSelect2 = $(".cate2");
	let cateSelect3 = $(".cate3");
	
	/* 카테고리 배열 초기화 메서드 */
	function makeCateArray(obj,array,cateList, tier){
		for(let i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);				
				
			}
		}
	}	
	
	makeCateArray(cate1Obj,cate1Array,cateList,1);
	makeCateArray(cate2Obj,cate2Array,cateList,2);
	makeCateArray(cate3Obj,cate3Array,cateList,3);
	
	/*$(document).ready(function(){
		console.log(cate1Array);
		console.log(cate2Array);
		console.log(cate3Array);
	});*/
	
	// 대분류 옵션
	for(let i = 0; i < cate1Array.length; i++){
	cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
	}
	
	/* 중분류 <option> 태그 */
	$(cateSelect1).on("change",function(){
		
		let selectVal1 = $(this).find("option:selected").val();	
		
		cateSelect2.children().remove();
		cateSelect3.children().remove();
		
		cateSelect2.append("<option value='none'>선택</option>");
		cateSelect3.append("<option value='none'>선택</option>");
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
		
	});
	
	/* 소분류 <option>태그 */
	$(cateSelect2).on("change",function(){
		
		let selectVal2 = $(this).find("option:selected").val();
		
		cateSelect3.children().remove();
		
		cateSelect3.append("<option value='none'>선택</option>");		
		
		for(let i = 0; i < cate3Array.length; i++){
			if(selectVal2 === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
			}
		}// for		
		
	});
	
	
	// 임대인 선택 버튼
	function leaseId_add(){
		var url = "/admin/leasePop";
		var name = "임대인 찾기";
		var option = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
	
		window.open(url, name, option);
	}
	
	
	/*$(document).ready(function(){
		console.log("${cateList}");
	});*/
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
		
		let formData = new FormData(); 
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;			
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});
	});
	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	// 이미지 출력
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
		
		str += "</div>";		
		
   		uploadResult.append(str);
	}
	
	// 이미지 삭제 버튼 동작
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	
	</script>

</body>
</html>