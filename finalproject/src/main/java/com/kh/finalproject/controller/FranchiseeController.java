package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.VO.Criteria;
import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.BranchImgDto;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.service.BranchService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/franchisee")
public class FranchiseeController {
	
	@Autowired
	private BranchDao branchDao;
	
	@Autowired
	private BranchService branchService;
	
	//목록 + 페이징
	@GetMapping("/list")
	public String list(PagingVO vo,Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			) {
		int total = branchService.countBranch();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", branchService.selectBranch(vo));
		return "/member/franchisee/list";
	}
	
	@GetMapping("/detail")
	public String detail(Model model,@RequestParam int branch_no) {
		BranchDto branchDto = branchDao.get(branch_no);
		List<BranchImgDto> list = branchService.getBranchImg(branch_no);
		model.addAttribute("branchImg", list);
		model.addAttribute("branchDto", branchDto);
		return "/member/franchisee/detail";
	}
	
}
