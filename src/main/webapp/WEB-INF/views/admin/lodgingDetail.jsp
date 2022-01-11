<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 조회 페이지</title>
<link rel="stylesheet"
	href="../resources/css/admin/lodgingDetail.css?aaaa">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}
</style>
</style>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>숙소 상세</span>
		</div>

		<div class="admin_content_main">

			<div class="form_section">
				<div class="form_section_title">
					<label>숙소 이름</label>
				</div>
				<div class="form_section_content">
					<input name="lodgingName"
						value="<c:out value="${lodgingInfo.lodgingName}"/>" disabled>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>등록 날짜</label>
				</div>
				<div class="form_section_content">
					<input
						value="<fmt:formatDate value='${lodgingInfo.regDate}' pattern='yyyy-MM-dd'/>"
						disabled>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>최근 수정 날짜</label>
				</div>
				<div class="form_section_content">
					<input
						value="<fmt:formatDate value='${lodgingInfo.updateDate}' pattern='yyyy-MM-dd'/>"
						disabled>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>임대인</label>
				</div>
				<div class="form_section_content">
					<input id="leaseId_input" readonly="readonly"
						value="${lodgingInfo.leaseId }" disabled>

				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>숙소 카테고리</label>
				</div>
				<div class="form_section_content">
					<div class="cate_wrap">
						<span>대분류</span> <select class="cate1" disabled>
							<option value="none">선택</option>
						</select>
					</div>
					<div class="cate_wrap">
						<span>중분류</span> <select class="cate2" disabled>
							<option value="none">선택</option>
						</select>
					</div>
					<div class="cate_wrap">
						<span>소분류</span> <select class="cate3" name="cateCode" disabled>
							<option value="none">선택</option>
						</select>
					</div>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>숙소 가격</label>
				</div>
				<div class="form_section_content">
					<input name="lodgingPrice"
						value="<c:out value="${lodgingInfo.lodgingPrice}"/>" disabled>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>숙소 재고</label>
				</div>
				<div class="form_section_content">
					<input name="lodgingStock"
						value="<c:out value="${lodgingInfo.lodgingStock}"/>" disabled>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>숙소 소개</label>
				</div>
				<div class="form_section_content bit">
					<textarea name="lodgingIntro" id="lodgingIntro_textarea" disabled>${lodgingInfo.lodgingIntro}</textarea>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>숙소 내용</label>
				</div>
				<div class="form_section_content bct">
					<textarea name="lodgingContents" id="lodgingContents_textarea"
						disabled>${lodgingInfo.lodgingContents}</textarea>
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>상품 이미지</label>
				</div>
				<div class="form_section_content">

					<div id="uploadResult"></div>
				</div>
			</div>

			<div class="btn_section">
				<button id="cancelBtn" class="btn">숙소 목록</button>
				<button id="modifyBtn" class="btn enroll_btn">수정</button>
			</div>
		</div>


		<form id="moveForm" action="/admin/lodgingList" method="get">
			<input type="hidden" name="pageNum" value="${cri.pageNum}"> <input
				type="hidden" name="amount" value="${cri.amount}"> <input
				type="hidden" name="keyword" value="${cri.keyword}">
		</form>

	</div>
	<%@include file="../includes/admin/footer.jsp"%>
	<script>
	$(document).ready(function(){
		
	
		/* 숙소 소개 */
		ClassicEditor
			.create(document.querySelector('#lodgingIntro_textarea'))
			.then(editor => {
				console.log(editor);
				editor.isReadOnly = true;
		})
			.catch(error=>{
				console.error(error);
		});
		
		/* 숙소 내용 */	
		ClassicEditor
		.create(document.querySelector('#lodgingContents_textarea'))
		.then(editor => {
			console.log(editor);
			editor.isReadOnly = true;
		})
		.catch(error=>{
			console.error(error);
		});
	
		/* 카테고리 */
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
	
		/* 배열 초기화 */
		makeCateArray(cate1Obj,cate1Array,cateList,1);
		makeCateArray(cate2Obj,cate2Array,cateList,2);
		makeCateArray(cate3Obj,cate3Array,cateList,3);
	
		let targetCate2 = '';
		let targetCate3 = '${lodgingInfo.cateCode}';
	
		for(let i = 0; i < cate3Array.length; i++){
			if(targetCate3 === cate3Array[i].cateCode){
				targetCate3 = cate3Array[i];
			}
		}// for
		
		console.log('targetCate3 : ' + targetCate3);
		console.log('targetCate3.cateName : ' + targetCate3.cateName);
		console.log('targetCate3.cateCode : ' + targetCate3.cateCode);
		console.log('targetCate3.cateparent : ' + targetCate3.cateParent);
	
		for(let i = 0; i < cate3Array.length; i++){
			if(targetCate3.cateParent === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");
			}
		}
	
		$(".cate3 option").each(function(i,obj){
			if(targetCate3.cateCode === obj.value){
				$(obj).attr("selected", "selected");
			}
		});
		
		for(let i = 0; i < cate2Array.length; i++){
			if(targetCate3.cateParent === cate2Array[i].cateCode){
				targetCate2 = cate2Array[i];	
			}
		}// for	

	
		for(let i = 0; i < cate2Array.length; i++){
			if(targetCate2.cateParent === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
			}
		}		
	
		$(".cate2 option").each(function(i,obj){
			if(targetCate2.cateCode === obj.value){
				$(obj).attr("selected", "selected");
			}
		});	
	
		for(let i = 0; i < cate1Array.length; i++){
			cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}
		
		$(".cate1 option").each(function(i,obj){
			if(targetCate2.cateParent === obj.value){
				$(obj).attr("selected", "selected");
			}
		});

		
		/* 이미지 정보 호출 */
		let lodgingId = '<c:out value="${lodgingInfo.lodgingId}"/>';
		let uploadResult = $("#uploadResult");			
		
		$.getJSON("/getAttachList", {lodgingId : lodgingId}, function(arr){
			
			if(arr.length === 0){
				let str = "";
				str += "<div id='result_card'>";
				str += "<img src='/resources/img/lodgingNoImage.png'>";
				str += "</div>";
				
				uploadResult.html(str);	
				return;
			}
			
			let str = "";
			let obj = arr[0];	
			
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "</div>";		
			
			uploadResult.html(str);						
			
		});
		
		
	}); // $(document).ready
	
	/* 목록 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();	
	});	
	
	/* 수정 페이지 이동 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		let addInput = '<input type="hidden" name="lodgingId" value="${lodgingInfo.lodgingId}">';
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action", "/admin/lodgingModify");
		$("#moveForm").submit();
	});
	
	</script>
</body>
</html>