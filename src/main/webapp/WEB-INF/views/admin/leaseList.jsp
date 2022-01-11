<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/leaseList.css?ab">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
	<%@include file="../includes/admin/header.jsp" %>
 	
 	<div class="admin_content_wrap">
 		<div class="admin_content_subject"><span>임대인 목록</span></div>
 			<div class="lease_table_wrap">
 			<!-- 게시물 O -->
				<c:if test="${listCheck != 'empty' }">
                    	<table class="lease_table">
                    		<thead>
                    			<tr>
                    				<td class="th_column_1">임대인 번호</td>
                    				<td class="th_column_2">임대인 이름</td>
                    				<td class="th_column_3">숙소 종류</td>
                    				<td class="th_column_4">등록 날짜</td>
                    				<td class="th_column_5">수정 날짜</td>
                    			</tr>
                    		</thead>
                    		<c:forEach items="${list}" var="list">
                    		<tr>
                    			<td><c:out value="${list.leaseId}"></c:out> </td>
                    			<td>
                    				<a class="move" href='<c:out value="${list.leaseId}"/>'>
										<c:out value="${list.leaseName}"></c:out>
									</a> 
                    			</td>
                    			<td><c:out value="${list.typeName}"></c:out> </td>
                    			<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
                    			<td><fmt:formatDate value="${list.updateDate}" pattern="yyyy-MM-dd"/></td>
                    		</tr>
                    		</c:forEach>
                    	</table>  
                    	</c:if>
                    	
                    	<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 임대인이 없습니다.
                			</div>
                		</c:if> 
                		              			
                    </div>      
                    <!-- 검색 영역 -->
                    <div class="search_wrap">
                    	<form id="searchForm" action="/admin/leaseList" method="get">
                    		<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<button class='btn search_btn'>검 색</button>
                    		</div>
                    	</form>
                    </div>
                    
                    <!-- 페이지 이동 인터페이스 영역 -->
                    <div class="pageMaker_wrap" >
                    
	                    <ul class="pageMaker">
	                    
	                    	<!-- 이전 버튼 -->
	                    	<c:if test="${pageMaker.prev}">
	                    		<li class="pageMaker_btn prev">
	                    			<a href="${pageMaker.pageStart-1}">이전</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    	<!-- 페이지 번호 -->
	                    	<c:forEach var="num" begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" >
	                    		<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
	                    			<a href="${num}">${num}</a>
	                    		</li>
	                    	</c:forEach>
	                    	
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    </ul>
	                    
                    </div>
                    <form id="moveForm" action = "/admin/leaseList" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>            
                </div>
                
   	 			<%@include file="../includes/admin/footer.jsp" %>
    

<script>

let moveForm = $('#moveForm');
let searchForm = $('#searchForm');

$(document).ready(function(){
    
    let result = '<c:out value="${enroll_result}"/>';
    let mresult = '<c:out value="${modify_result}"/>';
    
    checkResult(result);
    checkmResult(mresult);
    
    function checkResult(result){
        
        if(result === ''){
            return;
        }
        
        alert("임대인'${enroll_result}'을 등록하였습니다.");
    }
    
		function checkmResult(mresult){
		
		if(mresult === '1'){
			alert("임대인 정보 수정을 완료하였습니다.");
		} else if(mresult === '0') {
			alert("임대인 정보를 수정 하지 못하였습니다.")	
		}
		
	}
		/* 삭제 결과 경고창 */
		let delete_result = '${delete_result}';
		
		if(delete_result == 1){
			alert("삭제 완료");
		} else if(delete_result == 2){
			alert("해당 임대인 데이터를 사용하고 있는 데이터가 있어서 삭제 할 수 없습니다.")
		}	
});

/* 페이지 이동 버튼 */
$(".pageMaker_btn a").on("click", function(e){

   e.preventDefault();
   moveForm.find("input[name='pageNum']").val($(this).attr("href"));
   moveForm.attr("action", "../admin/leaseList");
   moveForm.submit();
});

/* 작거 검색 버튼 동작 */
$("#searchForm button").on("click", function(e){
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	searchForm.submit();
	
});

/* 임대인 상세 페이지 이동 */
$(".move").on("click", function(e){
	
	e.preventDefault();
	moveForm.append("<input type='hidden' name='leaseId' value='"+ $(this).attr("href") + "'>");
	moveForm.attr("action", "/admin/leaseDetail");
	moveForm.submit();
	
});
</script>
 
</body>
</html>
