package com.reserve.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.reserve.model.MemberVO;
import com.reserve.model.ReserveDTO;
import com.reserve.model.ReservePageDTO;
import com.reserve.service.MemberService;
import com.reserve.service.ReserveService;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService reserveService;

	@Autowired
	private MemberService memberService;

	@GetMapping("/reserve/{memberId}")
	public String reservePageGET(@PathVariable("memberId") String memberId, ReservePageDTO rpd, Model model) {

		model.addAttribute("reserveList", reserveService.getLodgingInfo(rpd.getReserves()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));

		return "/reserve";
	}

	@PostMapping("/reserve")
	public String reservePagePost(ReserveDTO rd, HttpServletRequest request) {

		System.out.println(rd);

		reserveService.reserve(rd);

		MemberVO member = new MemberVO();
		member.setMemberId(rd.getMemberId());

		HttpSession session = request.getSession();

		try {
			MemberVO memberLogin = memberService.memberLogin(member);
			memberLogin.setMemberPw("");
			session.setAttribute("member", memberLogin);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/main";
	}

}
