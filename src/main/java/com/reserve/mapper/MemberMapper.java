package com.reserve.mapper;

import com.reserve.model.MemberVO;

public interface MemberMapper {
	// 회원가입
	public void memberJoin(MemberVO member);
	
	// 아이디 중복 검사
	public int idCheck(String memberId);
	
	// 로그인
	public MemberVO memberLogin(MemberVO member);
	
	// 예약자 정보
	public MemberVO getMemberInfo(String memberId);
}
