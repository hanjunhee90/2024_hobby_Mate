package com.hobby.my.member.web;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hobby.my.member.service.MemberService;
import com.hobby.my.member.vo.MbtiVO;
import com.hobby.my.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memService;
	
	@Value("#{util['file.upload.path']}")
	private String CURR_IMAGE_PATH;
	
	@Value("#{util['file.download.path']}")
	private String WEB_PATH;
	
	// 로그인뷰 연결
	@RequestMapping("/login")
	public String loginView(MemberVO member) {
		return "member/login";
	}
	
	// 로그인 요청시
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO memberVO, HttpSession session) {
		System.out.println(memberVO);
		try {
			MemberVO login = memService.loginMember(memberVO);
			if(login == null) {
				return "/login";
			}
			session.setAttribute("login", login);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "home";
	}
	
	@RequestMapping("/logoutDo")
	public String logout(HttpSession session) throws Exception{
		
		// 세션 초기화
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원가입뷰 연결
	@RequestMapping("/regist")
	public String registView(MemberVO member, Model model) {
		ArrayList<MbtiVO> mbtiList = memService.mbtiList();
		model.addAttribute("mbtiList", mbtiList);
		return "member/regist";
	}
	
	/*회원가입 - member, hobby*/
	/*@RequestParam("profileImg") MultipartFile profileImg)*/
	@PostMapping("/registDo")
	public String registerMember(Model model,
	                             @ModelAttribute MemberVO memberVO) {

	    // memberVO (디버깅용)
	    System.out.println(memberVO);

	    // 서비스 메서드 호출
	    try {
			memService.registerMember(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

	    // 다음 페이지로 이동 (회원가입 완료 후 로그인 페이지로)
	    return "member/login";
	}
	
	@RequestMapping("/mypage")
	public String myPageView(HttpSession session, Model model) {
		MemberVO loginMember = (MemberVO) session.getAttribute("login");
		if (loginMember == null) {
			return "redirect:/loginView"; // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
		}
		model.addAttribute("login", loginMember);
		return "member/mypage";
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute MemberVO memberVO, HttpSession session) {
	    try {
	        // 파일 업로드 처리
	        MultipartFile file = memberVO.getProfileImgFile();
	        
	        if (file != null && !file.isEmpty()) {
	            // 파일 이름 추출
	            String fileName = file.getOriginalFilename();
	            // 저장 경로 설정
	            String filePath = CURR_IMAGE_PATH + "\\" + fileName;
	        
	            // 파일을 서버에 저장
	            file.transferTo(new File(filePath));
	            
	            // 파일 경로를 문자열로 저장
	            memberVO.setProfileImg(WEB_PATH + fileName);
	        }
	        
	        // 세션에서 로그인한 회원 정보 확인
	        MemberVO sessionMember = (MemberVO) session.getAttribute("login");
	        
	        if (sessionMember != null) {
	            // 세션에 있는 회원의 ID로 DB 업데이트
	            memberVO.setMemId(sessionMember.getMemId());
	            memService.updateMember(memberVO);
	            
	            // 업데이트된 회원 정보를 다시 세션에 저장
	            session.setAttribute("login", memberVO);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return "redirect:/mypage";
	}
	
	 @PostMapping("/checkId")
	 @ResponseBody
	 public int checkId(@RequestParam("memId") String memId) {
		 int checked = memService.checkId(memId);
		 if(checked == 0) {
			 return checked;
		 }else {
			 return checked;
		 }
	 }

}