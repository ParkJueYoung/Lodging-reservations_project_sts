<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/reserveList.css?abcd">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>

	<div class="admin_content_wrap">
		<div class = "admin_content_subject"><span>예약 현황</span></div>
		<div class="admin_content_subject"></div>
			<!-- <span>임대인 목록</span> -->
		<div class="lease_table_wrap">
			<!-- 게시물 O -->
			<c:if test="${listCheck != 'empty' }">
				<table class="reserve_table">
	                    	<colgroup>
	                    		<col width="21%">
	                    		<col width="20%">
	                    		<col width="20%">
	                    		<col width="20%">
	                    		<col width="19%%">
	                    	</colgroup>
	                    		<thead>
	                    			<tr>
	                    				<td class="th_column_1">예약 번호</td>
	                    				<td class="th_column_2">예약자 아이디</td>
	                    				<td class="th_column_3">예약 날짜</td>
	                    				<td class="th_column_4">예약 상태</td>
	                    				<td class="th_column_5">취소</td>
	                    			</tr>
	                    		</thead>
	                    		<c:forEach items="${list}" var="list">
	                    		<tr>
	                    			<td><c:out value="${list.reserveId}"></c:out> </td>
	                    			<td><c:out value="${list.memberId}"></c:out></td>
	                    			<td><fmt:formatDate value="${list.reserveDate}" pattern="yyyy-MM-dd"/></td>
	                    			<td><c:out value="${list.reserveState}"/></td>
	                    			<td>
	                    				<c:if test="${list.reserveState == '예약대기' }">
	                    					<button class = "delete_btn" data-reserveid = "${list.reserveId }">취소</button>
	                    				</c:if>
	                    			</td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
			</c:if>

			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 임대인이 없습니다.</div>
			</c:if>

		</div>
		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form id="searchForm" action="/admin/reserveList" method="get">
				<div class="search_input">
					<input type="text" name="keyword"
						value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
					<input type="hidden" name="pageNum"
						value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
					<button class='btn search_btn'>검 색</button>
				</div>
			</form>
		</div>

		<!-- 페이지 이동 인터페이스 영역 -->
		<div class="pageMaker_wrap">

			<ul class="pageMaker">

				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageMaker_btn prev"><a
						href="${pageMaker.pageStart-1}">이전</a></li>
				</c:if>

				<!-- 페이지 번호 -->
				<c:forEach var="num" begin="${pageMaker.pageStart}"
					end="${pageMaker.pageEnd}">
					<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageMaker_btn next"><a
						href="${pageMaker.pageEnd + 1 }">다음</a></li>
				</c:if>

			</ul>

		</div>
		<form id="moveForm" action="/admin/reserveList" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
		
		<form id="deleteForm" action="/admin/reserveCancel" method="post">
			<input type="hidden" name="reserveId">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			<input type="hidden" name="memberId" value="${member.memberId}">
		</form>
                    
	</div>

	<%@include file="../includes/admin/footer.jsp"%>


	<script>
	
	let searchForm = $('#searchForm');
	let moveForm = $('#moveForm');
	
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
	
	
	/* 페이지 이동 버튼 */
	$(".pageMaker_btn a").on("click", function(e){
		
		e.preventDefault();
		
		console.log($(this).attr("href"));
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		moveForm.submit();
		
	});
	
	$(".delete_btn").on("click", function(e){
		
		e.preventDefault();
		
		let id = $(this).data("reserveid");
		
		$("#deleteForm").find("input[name='reserveId']").val(id);
		$("#deleteForm").submit();
	});
	
	</script>

</body>
</html>
