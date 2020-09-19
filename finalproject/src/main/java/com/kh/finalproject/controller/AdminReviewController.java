package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.repository.ReviewDao;

@Controller
@RequestMapping("/admin/review")
public class AdminReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private BranchDao branchDao;
	
	@GetMapping("/list")
	public String list(
			HttpSession session,Model model,
			@RequestParam(defaultValue = "0", required=false) int branch_no
			) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		if(adminDto.getAdmin_auth().equals("본사")) {
			model.addAttribute("branchDto",branchDao.getList());
			if(branch_no != 0) {
				model.addAttribute("list", reviewDao.getBranchList(branch_no));
			}else {
				model.addAttribute("list", reviewDao.getAdminList());
			}
			//전체 리뷰 목록
		}else {
			//지점장 no로 지점번호 뽑기
			int admin_no = adminDto.getAdmin_no();
			branch_no = reviewDao.getBranchNo(admin_no);
			//해당 지점의 리뷰
			model.addAttribute("list", reviewDao.getBranchList(branch_no));
		}
		return "admin/review/list";
	}
}
