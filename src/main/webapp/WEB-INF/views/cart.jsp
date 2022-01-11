<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박 예약</title>
<link rel="stylesheet" href="/resources/css/cart.css?sqqqzzzq">
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
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				<!-- 체크박스 전체 여부 -->
		<div class="all_check_input_div">
			<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
		</div>
		
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">숙소명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1 cart_info_td">
									<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
									<input type="hidden" class="individual_lodgingPrice_input" value="${ci.lodgingPrice}">
									<input type="hidden" class="individual_lodgingCount_input" value="${ci.lodgingCount}">
									<input type="hidden" class="individual_totalPrice_input" value="${ci.lodgingPrice * ci.lodgingCount}">
									<input type="hidden" class="individual_lodgingId_input" value="${ci.lodgingId }">
								</td>
								<td class="td_width_2">
									<div class="image_wrap" data-lodgingid="${ci.imageList[0].lodgingId}" data-path="${ci.imageList[0].uploadPath}" data-uuid="${ci.imageList[0].uuid}" data-filename="${ci.imageList[0].fileName}">
										<img>
									</div>
								</td>
								<td class="td_width_3">${ci.lodgingName}</td>
								<td class="td_width_4 price_td">
									정가 : <fmt:formatNumber value="${ci.lodgingPrice}" pattern="#,### 원" /><br>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ci.lodgingCount}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn" data-cartId="${ci.cartId}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.lodgingPrice * ci.lodgingCount}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center"><button class="delete_btn" data-cartid="${ci.cartId}">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 숙소 가격</td>
										<td>
											<span class="totalPrice_span"></span> 원
										</td>
									</tr>
									<tr>
										<td>총 주문 숙소 수</td>
										<td><span class="totalKind_span"></span>종 <span class="totalCount_span"></span>개</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 예약 버튼 영역 -->
			<div class="content_btn_section">
				<a class="reserve_btn">예약 하기</a>			
			</div>
			
			<!-- 수량 조정 form -->
			<form action="/cart/update" method="post" class="quantity_update_form">
				<input type="hidden" name="cartId" class="update_cartId">
				<input type="hidden" name="lodgingCount" class="update_lodgingCount">
				<input type="hidden" name="memberId" value="${member.memberId}">
			</form>
			
			<!-- 삭제 form -->
			<form action="/cart/delete" method="post" class="quantity_delete_form">
				<input type="hidden" name="cartId" class="delete_cartId">
				<input type="hidden" name="memberId" value="${member.memberId}">
			</form>
			
			<!-- 주문 form -->
			<form action="/reserve/${member.memberId}" method="get" class="reserve_form">

			</form>
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
                    (주) BootCamp    대표이사 : 박주영
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

<script>


$(document).ready(function(){
	
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
			$(this).find("img").attr('src', '/resources/img/Noimage.png');
		}
		
	});
	
});

/* 체크여부에따른 종합 정보 변화 */
$(".individual_cart_checkbox").on("change", function(){
	/* 총 예약 정보 세팅 */
	setTotalInfo($(".cart_info_td"));
});

/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function(){

	/* 체크박스 체크/해제 */
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").attr("checked", true);
	} else{
		$(".individual_cart_checkbox").attr("checked", false);
	}
	
	/* 총 예약 정보 세팅 */
	setTotalInfo($(".cart_info_td"));	
	
});

function setTotalInfo(){
	/* 종합 정보 섹션 정보 삽입 */
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 개수
	let totalKind = 0;				// 총 종류
	let finalTotalPrice = 0; 		// 최종 가격(총 가격)	
	
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 개수
		totalCount += parseInt($(element).find(".individual_lodgingCount_input").val());
		
		// 총 종류
		totalKind += 1;
		}
	});	
	
	
	/* 최종 가격 */
	finalTotalPrice = totalPrice; 
	
	// 총 가격
	$(".totalPrice_span").text(finalTotalPrice.toLocaleString());
	// 총 개수
	$(".totalCount_span").text(totalCount);
	// 총 종류
	$(".totalKind_span").text(totalKind);	
	// 최종 가격(총 가격)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	
}

/* 수량버튼 */
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});

/* 수량 수정 버튼 */
$(".quantity_modify_btn").on("click", function(){
	let cartId = $(this).data("cartid");
	let lodgingCount = $(this).parent("td").find("input").val();
	$(".update_cartId").val(cartId);
	$(".update_lodgingCount").val(lodgingCount);
	$(".quantity_update_form").submit();
	
});

/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	e.preventDefault();
	const cartId = $(this).data("cartid");
	$(".delete_cartId").val(cartId);
	$(".quantity_delete_form").submit();
});

/* 예약 페이지 이동 */	
$(".reserve_btn").on("click", function(){
	
	let form_contents ='';
	let reserveNumber = 0;
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			
			let lodgingId = $(element).find(".individual_lodgingId_input").val();
			let lodgingCount = $(element).find(".individual_lodgingCount_input").val();
			
			let lodgingId_input = "<input name='reserves[" + reserveNumber + "].lodgingId' type='hidden' value='" + lodgingId + "'>";
			form_contents += lodgingId_input;
			
			let lodgingCount_input = "<input name='reserves[" + reserveNumber + "].lodgingCount' type='hidden' value='" + lodgingCount + "'>";
			form_contents += lodgingCount_input;
			
			reserveNumber += 1;
			
		}
	});	

	$(".reserve_form").html(form_contents);
	$(".reserve_form").submit();
	
});
</script>
</body>
</html>