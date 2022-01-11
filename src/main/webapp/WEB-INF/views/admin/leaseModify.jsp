<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/leaseModify.css?aaa">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
				<%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>임대인 상세</span></div>
                    <div class="admin_content_main">
                    	<form id="modifyForm" action="/admin/leaseModify" method="post">
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>임대인 번호</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" name="leaseId" readonly="readonly" value="<c:out value='${leaseInfo.leaseId }'></c:out>">
	                   			</div>
	                   		</div>                    
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>임대인 이름</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input name="leaseName" value="<c:out value='${leaseInfo.leaseName }'></c:out>" >
	                   				<span id="warn_leaseName">임대인 이름을 입력 해주세요.</span>
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>임대인 종류</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<select name="typeId" >
	                   					<option value="none" disabled="disabled">=== 선택 ===</option>
	                   					<option value="01" <c:out value=" ${leaseInfo.typeId eq '01' ?'selected':''}"/>>캠핑장</option>
	                   					<option value="02" <c:out value=" ${leaseInfo.typeId eq '02' ?'selected':''}"/>>카라반</option>
	                   				</select>
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>임대인 소개</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<textarea name="leaseIntro" ><c:out value='${leaseInfo.leaseIntro }'/></textarea>
	                   				<span id="warn_leaseIntro">임대인 소개를 입력 해주세요.</span>
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>등록 날짜</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${leaseInfo.regDate}" pattern="yyyy-MM-dd"/>">
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>수정 날짜</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${leaseInfo.updateDate}" pattern="yyyy-MM-dd"/>">
	                   			</div>
	                   		</div>
	                 		<div class="btn_section">
	                   			<button id="cancelBtn" class="btn">취소</button>
		                    	<button id="modifyBtn" class="btn modify_btn">수 정</button>
		                    	<button id="deleteBtn" class="btn delete_btn">삭 제</button>
		                    </div> 
	                    </form>
                    </div>                    
                </div>
                
                <form id="moveForm" method="get">
                	<input type="hidden" name="leaseId" value='<c:out value="${leaseInfo.leaseId }"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
                </form>
				<%@include file="../includes/admin/footer.jsp" %>
				
<script>
let moveForm = $("#moveForm");
let modifyForm = $("#modifyForm");

/* 임대인 상세 페이지 이동 버튼 */
$("#cancelBtn").on("click", function(e){
	
	e.preventDefault();
			
	moveForm.attr("action", "/admin/leaseDetail")
	moveForm.submit();
	
});

/* 삭제 버튼 */
$("#deleteBtn").on("click", function(e){
	e.preventDefault();
	moveForm.find("input").remove();
	moveForm.append('<input type="hidden" name="leaseId" value="${leaseInfo.leaseId}">');
	moveForm.attr("action", "/admin/leaseDelete");
	moveForm.attr("method", "post");
	moveForm.submit();
});

/* 임대인 수정 버튼 작동 및 유효성 검사 */
$("#modifyBtn").on("click", function(e){

	let leaseName = $(".form_section_content input[name='leaseName']").val();
	let leaseIntro = $(".form_section_content textarea").val();		

	let	nameCk = false;
	let introCk = false;		
	
	e.preventDefault();
	
	if(!leaseName){
		$("#warn_leaseName").css("display", "block");
	} else {
		$("#warn_leaseName").css("display", "none");
		nameCk = true;
	}
	if(!leaseIntro){
		$("#warn_leaseIntro").css("display", "block");
	} else {
		$("#warn_leaseIntro").css("display", "none");
		introCk = true;
	}

	
	if(nameCk && introCk ){
		modifyForm.submit();	
	} else {
		return false;
	}
	
	
});
</script>


</body>
</html>