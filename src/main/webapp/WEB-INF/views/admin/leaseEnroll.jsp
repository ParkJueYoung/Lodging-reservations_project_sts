<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/leaseEnroll.css?aaa">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
    <%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>임대인 등록</span></div>
                    <div class="admin_content_main">
                    	<form action="/admin/leaseEnroll.do" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>임대인 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="leaseName">
                    				<span id="warn_leaseName">임대인 이름을 입력 해주세요.	</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>숙소 종류</label>
                    			</div>
                    			<div class="form_section_content">
                    				<select name="typeId">
                    					<option value="none" selected>=== 선택 ===</option>
                    					<option value="01">카라반</option>
                    					<option value="02">캠핑장</option>
                    				</select>
                    				<span id="warn_typeId">임대인 종류를 선택해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>임대인 소개</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="leaseIntro" type="text">
                    				<span id="warn_leaseIntro">임대인 소개를 입력 해주세요.</span>
                    			</div>
                    		</div>
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>
                </div>
        
        <%@include file="../includes/admin/footer.jsp" %>
<script>
 
/* 등록 버튼 */
$("#enrollBtn").click(function(){    
    /* 검사 통과 유무 변수 */
    let nameCheck = false;            
    let typeCheck = false;        
    let introCheck = false;   
    
    /* 입력값 변수 */
    let leaseName = $('input[name=leaseName]').val();      
    let typeId = $('select[name=typeId]').val();        
    let leaseIntro = $('input[name=leaseIntro]').val();   
    /* 공란 경고 span태그 */
    let wLeaseName = $('#warn_leaseName');
    let wTypeId = $('#warn_typeId');
    let wLeaseIntro = $('#warn_leaseIntro'); 
    
    /* 임대인 이름 공란 체크*/
    if(leaseName === ''){
    	wLeaseName.css('display', 'block');
    	nameCheck = false;
    }else{
    	wLeaseName.css('display', 'none');
    	nameCheck = true;
    }
    
    /* 임대인 종류 공란 체크 */
    if(typeId === 'none'){
    	wTypeId.css('display', 'block');
    	typeCheck = false;
    }else{
    	wTypeId.css('display', 'none');
    	typeCheck = true;
    }
    
    /* 임대인 소개 공란 체크 */
    if(leaseIntro === ''){
    	wLeaseIntro.css('display', 'block');
    	introCheck = false;
    }else{
    	wLeaseIntro.css('display', 'none');
    	introCheck = true;
    }
    
    /* 검사 */
    if(nameCheck && typeCheck && introCheck){
    	$("#enrollForm").submit();
    }else{
    	return;
    }
    
});
 
/* 취소 버튼 */
$("#cancelBtn").click(function(){
    location.href="/admin/leaseList"
});
 
</script>
 
</body>
</html>