<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박 예약</title>
<link rel="stylesheet" href="/resources/css/lodgingDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<ul class="list">
					<c:if test="${member == null}">
						<li><a href="/member/login">로그인</a></li>
						<li><a href="/member/join">회원가입</a></li>
					</c:if>
					<c:if test="${member != null }">
						<c:if test="${member.adminCk == 1 }">
							<li><a href="/admin/main">관리자 페이지</a></li>
						</c:if>
						<li><a id="gnb_logout_button">로그아웃</a></li>
						<li>마이페이지</li>
						<li><a href = "/cart/${member.memberId }">장바구니</a></li>
					</c:if>
					<li>고객센터</li>
				</ul>
			</div>
			<div class="top_area">
				<!-- 로고 영역 -->
				<div class="logo_area">
					<a href="/main"><img src="/resources/img/Logo.png"></a>
				</div>
				<div class="search_area">
					<div class="search_wrap">
						<form id="searchForm" action="/search" method="get">
							<div class="search_input">
								<select name="type">
									<option value="T">숙소 이름</option>
									<option value="A">임대인</option>
								</select> <input type="text" name="keyword"
									value="<c:out value ="${pageMaker.cri.keyword }"/>">
								<button class='btn search_btn'>검 색</button>
							</div>
						</form>
					</div>
				</div>
				<div class="login_area">
					<!--  로그인 안한 상태 -->
					<c:if test="${member == null }">
						<div class="login_button">
							<a href="/member/login">로그인</a>
						</div>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>

					<!-- 로그인한 상태 -->
					<c:if test="${ member != null }">
						<div class="login_success_area">
							<span>회원 : ${member.memberName}</span> <a
								href="/member/logout.do">로그아웃</a>
						</div>
					</c:if>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="content_area">
				<div class="line"></div>
				<div class="content_top">
					<div class="ct_left_area">
						<div class="image_wrap"
							data-lodgingid="${lodgingInfo.imageList[0].lodgingId}"
							data-path="${lodgingInfo.imageList[0].uploadPath}"
							data-uuid="${lodgingInfo.imageList[0].uuid}"
							data-filename="${lodgingInfo.imageList[0].fileName}">
							<img>
						</div>
					</div>
					<div class="ct_right_area">
						<div class="title">
							<h1>${lodgingInfo.lodgingId}</h1>
						</div>
						<div class="line"></div>
						<div class="lease">
							<span> ${lodgingInfo.leaseId} 임대인 </span> 
						</div>
						<div class="line"></div>
						
						<div class="price">
							<div class="org_price">정가 : ${lodgingInfo.lodgingPrice } 원</div>
						</div>
						<div class="line"></div>
						<div class="button">
							<div class="button_quantity">
								예약수량 
								<input type="text" class="quantity_input" value="1">
								<span>
									<button class="plus_btn">+</button>
									<button class="minus_btn">-</button>
								</span>
							</div>
							<div class="button_set">
								<a class="btn_cart">장바구니 담기</a>
								<a class="btn_buy">바로 예약</a>
							</div>
						</div>
					</div>
				</div>
				<div class="line"></div>
				<div class="content_middle">
					<div class="lodging_intro">${lodgingInfo.lodgingIntro}</div>
					<div class="lodging_content">${lodgingInfo.lodgingContents }</div>
				</div>
				<div class="line"></div>
				<div class="content_bottom">리뷰</div>
			</div>
			
			<!-- 주문 form -->
			<form action="/reserve/${member.memberId}" method="get" class="reserve_form">
				<input type="hidden" name="reserves[0].lodgingId" value="${lodgingInfo.lodgingId}">
				<input type="hidden" name="reserves[0].lodgingCount" value="">
			</form>
			
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
			</div>
			<!-- class="footer_nav" -->

			<div class="footer">
				<div class="footer_container">

					<div class="footer_left">
						<img src="/resources/img/Logo.png">
					</div>
					<div class="footer_right">
						(주) BootCamp 대표이사 : 박주영 <br> 사업자등록번호 : 123-45-67890 <br>
						대표전화 : 1111-1111(발신자 부담전화) <br> <br> COPYRIGHT(C) <strong>abc.com</strong>
						ALL RIGHTS RESERVED.
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- class="footer" -->
		</div>
	</div>

	<script>
		
	$(document).ready(function(){
	
		/* 이미지 삽입 */
		const bobj = $(".image_wrap");
		
		if(bobj.data("lodgingid")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			bobj.find("img").attr('src', '/resources/img/lodgingNoImage.png');
		}

	});
	
	// 수량 버튼 조작
	let quantity = $(".quantity_input").val();
	
	$(".plus_btn").on("click", function(){
		$(".quantity_input").val(++quantity);
	});
	
	$(".minus_btn").on("click", function(){
		if(quantity > 1){
			$(".quantity_input").val(--quantity);	
		}
	});
	
	// 서버로 전송할 데이터
	const form = {
			memberId : '${member.memberId}',
			lodgingId : '${lodgingInfo.lodgingId}',
			lodgingCount : ''
	}

	// 장바구니 추가 버튼
	$(".btn_cart").on("click", function(e){
		form.lodgingCount = $(".quantity_input").val();
		$.ajax({
			url: '/cart/add',
			type: 'POST',
			data: form,
			success: function(result){
				cartAlert(result);
			}
		})
	});
	
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
	
	/* 바로구매 버튼 */
	$(".btn_buy").on("click", function(){
			
		let lodgingCount = $(".quantity_input").val();
		$(".reserve_form").find("input[name='reserves[0].lodgingCount']").val(lodgingCount);
		$(".reserve_form").submit();
		
	});
			
	</script>
</body>
</html>