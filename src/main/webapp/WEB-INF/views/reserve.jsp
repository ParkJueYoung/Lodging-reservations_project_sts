<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박 예약</title>
<link rel="stylesheet" href="/resources/css/reserve.css?kkksdkfsdkfk">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
   <div class="wrap">
      <div class="top_gnb_area">
         <ul class="list">
         	<c:if test = "${member == null}">
         <li>
         	<a href="/member/login">로그인</a>
         </li>
         <li>
         	<a href="/member/join">회원가입</a>
         </li>
         </c:if>
         <c:if test="${member != null }">   
         	 <c:if test="${member.adminCk == 1 }">
                    <li><a href="/admin/main">관리자 페이지</a></li>
                    </c:if>                
          	 <li><a id="gnb_logout_button">로그아웃</a></li>
          	 <li>마이페이지</li>
          	 <li><a href="/cart/${member.memberId}">장바구니</a></li>
          </c:if>
         <li>고객센터</li>
         </ul>
      </div>
      <div class="top_area">
         <div class="logo_area">
            <a href="/main"><img src="../resources/img/Logo.png"></a>
         </div>
         <div class="search_area">
            <div class="search_wrap">
                		<form id="searchForm" action="/search" method="get">
                			<div class="search_input">
                				<select name="type">
                					<option value="T">숙소</option>
                					<option value="A">임대인</option>
                				</select>
                				<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"></c:out>">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
         </div>
         <div class="login_area">
            <!--  로그인 안한 상태 -->
            <c:if test = "${member == null }">
                    <div class="login_button"><a href="/member/login">로그인</a></div>
                    <span><a href="/member/join">회원가입</a></span>                
                </c:if>
                
                <!-- 로그인한 상태 -->
                <c:if test="${ member != null }">
                  <div class="login_success_area">
                        <span>회원 : ${member.memberName}</span>
                        <a href="/member/logout.do">로그아웃</a>
                    </div>
                </c:if>
         </div>
         <div class="clearfix"></div>         
      </div>
      <div class="content_area">
      	<div class="content_subject"><span>장바구니</span></div>
		<div class="content_main">
			<!-- 회원 정보 -->
			<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">예약자</th>
								<td style="width: *">${memberInfo.memberName} | ${memberInfo.memberMail}</td>
							</tr>
						</tbody>
					</table>
				</div>
			<!-- 숙소 정보 -->
			<div class="reserveLodging_div">
		<!-- 숙소 종류 -->
		<div class="lodging_kind_div">
			예약숙소 <span class="lodging_kind_div_kind"></span>종 <span class="lodging_kind_div_count"></span>개
		</div>
		<!-- 숙소 테이블 -->
		<table class="lodging_subject_table">
			<colgroup>
				<col width="15%">
				<col width="45%">
				<col width="40%">
			</colgroup>
			<tbody>
				<tr>
					<th>이미지</th>
					<th>숙소 정보</th>
					<th>판매가</th>
				</tr>
			</tbody>
		</table>
		<table class="lodging_table">
			<colgroup>
				<col width="15%">
				<col width="45%">
				<col width="40%">
			</colgroup>					
			<tbody>
				<c:forEach items="${reserveList}" var="ol">
					<tr>
						<td>
							<div class="image_wrap" data-lodgingid="${ol.imageList[0].lodgingId}" data-path="${ol.imageList[0].uploadPath}" data-uuid="${ol.imageList[0].uuid}" data-filename="${ol.imageList[0].fileName}">
								<img>
							</div>
						</td>
						<td>${ol.lodgingName}</td>
						<td class="lodging_table_price_td">
							<br><fmt:formatNumber value="${ol.lodgingPrice}" pattern="#,### 원" />| 수량 ${ol.lodgingCount}개
							<!-- <br><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" /> -->
							<input type="hidden" class="individual_lodgingPrice_input" value="${ol.lodgingPrice}">
							<input type="hidden" class="individual_lodgingCount_input" value="${ol.lodgingCount}">
							<input type="hidden" class="individual_totalPrice_input" value="${ol.lodgingPrice * ol.lodgingCount}">
							<input type="hidden" class="individual_lodgingId_input" value="${ol.lodgingId}">
						</td>
					</tr>							
				</c:forEach>

			</tbody>
		</table>
	</div>
			
	<!-- 주문 종합 정보 -->
		<div class="total_info_div">
		<!-- 가격 종합 정보 -->
		<div class="total_info_price_div">
			<ul>
				<li>
					<span class="price_span_label">숙소 금액</span>
					<span class="totalPrice_span">100000</span>원
				</li>				
				<li class="price_total_li">
					<strong class="price_span_label total_price_label">최종 결제 금액</strong>
					<strong class="strong_red">
						<span class="total_price_red finalTotalPrice_span">
							1500000
						</span>원
					</strong>
				</li>
			</ul>
		</div>
		<!-- 버튼 영역 -->
		<div class="total_info_btn_div">
			<a class="reserve_btn">결제하기</a>
		</div>
	</div>
			
		</div>
      </div>
      <!-- Footer 영역 -->
        <div class="footer_nav">
            <div class="footer_nav_container">
                <ul>
                    <li>회사소개</li>
                    <span class="line">|</span>
                    <li>이용약관</li>
                    <span class="line">|</span>
                    <li>고객센터</li>
                    <span class="line">|</span>
                    <li>광고문의</li>
                    <span class="line">|</span>
                    <li>채용정보</li>
                    <span class="line">|</span>
                </ul>
            </div>
        </div> <!-- class="footer_nav" -->
        
        <div class="footer">
            <div class="footer_container">
                
                <div class="footer_left">
                    <img src="../resources/img/Logo.png">
                </div>
                <div class="footer_right">
                    (주) BootCamp    대표이사 : 김대중
                    <br>
                    사업자등록번호 : 123-45-67890
                    <br>
                    대표전화 : 1111-1111(발신자 부담전화)
                    <br>
                    <br>
                    COPYRIGHT(C) <strong>abc.com</strong>    ALL RIGHTS RESERVED.
                </div>
                <div class="clearfix"></div>
            </div>
        </div> <!-- class="footer" -->  
   </div>
</div>
		<!-- 예약 요청 form -->
		<form class="reserve_form" action="/reserve" method="post">
			<!--  회원번호 -->
			<input name="memberId" value="${memberInfo.memberId}" type="hidden">
			<!-- 숙소 정보 -->
		</form>

<script>
$(document).ready(function(){
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
		
		if(bobj.data("lodgingid")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/img/lodgingNoImage.png');
		}
		
	});
	
});

/* 총 주문 정보 */
function setTotalInfo(){

	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 개수
	let totalKind = 0;				// 총 종류
	let finalTotalPrice = 0; 		// 최종 가격	
	
	$(".lodging_table_price_td").each(function(index, element){
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 개수
		totalCount += parseInt($(element).find(".individual_lodgingCount_input").val());
		// 총 종류
		totalKind += 1;
	});	
	
	/* 최종 가격 */
	finalTotalPrice = totalPrice;

	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 개수
	$(".lodging_kind_div_count").text(totalCount);
	// 총 종류
	$(".lodging_kind_div_kind").text(totalKind);	
	// 최종 가격
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());	
	
	
}

/* 예약 요청 */
$(".reserve_btn").on("click", function(){

	/* 숙소정보 */
	let form_contents = ''; 
	$(".lodging_table_price_td").each(function(index, element){
		let lodgingId = $(element).find(".individual_lodgingId_input").val();
		let lodgingCount = $(element).find(".individual_lodgingCount_input").val();
		let lodgingId_input = "<input name='reserves[" + index + "].lodgingId' type='hidden' value='" + lodgingId + "'>";
		form_contents += lodgingId_input;
		let lodgingCount_input = "<input name='reserves[" + index + "].lodgingCount' type='hidden' value='" + lodgingCount + "'>";
		form_contents += lodgingCount_input;
	});	
	$(".reserve_form").append(form_contents);	
	
	/* 서버 전송 */
	$(".reserve_form").submit();
	
});

</script>
</body>
</html>