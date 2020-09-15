package com.kh.finalproject.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.BranchImgDto;
import com.kh.finalproject.entity.LocalDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.repository.LocalDao;
import com.kh.finalproject.service.BranchService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/branch")
public class BranchController {
		
	@Autowired
	private BranchDao branchDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private LocalDao localDao;
	
	@Autowired
	private BranchService branchService;
	
	
	@GetMapping("/branch_regist")
	public String regist(Model model) {
		List<LocalDto> local = localDao.getList();
		List<AdminDto> admin = adminDao.getBranchAdminList();
		model.addAttribute("admin", admin);
		model.addAttribute("local", local);
		return "admin/branch/branch_regist";
	}
	
	//지점 등록 메소드
	@PostMapping("/branch_regist")
	public String regist(Model model,@ModelAttribute BranchDto branchDto,@RequestParam List<MultipartFile> file) throws IllegalStateException, IOException {
		int branch_no = branchDao.regist(branchDto,file);
		return "redirect:list";
	}
	
	//지점 목록 메소드
	@GetMapping("/list")
	public String list(Model model) {
		List<BranchDto> list = branchDao.getList();
		model.addAttribute("branch", list);
		return "admin/branch/list";
	}
	
	//지점 배치도 등록
	@GetMapping("/layout_regist")
	public String layout() {
		return "admin/branch/layout_regist";
	}
	
	//배치도 등록
	@PostMapping("/layout_regist")
	public String layout(@RequestParam int branch_no,@RequestParam String branch_layout) {
		branchDao.layout_regist(branch_layout, branch_no);
		return "redirect:list";
	}
	
	//지점 단일조회
	@GetMapping("/detail")
	public String detail(@RequestParam int branch_no, Model model,RedirectAttributes attr) {
		BranchDto branchDto = branchDao.get(branch_no);
		
		// 여기서 이제 브런치이미지디티오 리스트를 받아서 모델로 뿌려주는거야 
		List<BranchImgDto> list = branchService.getBranchImg(branch_no);
		model.addAttribute("branchImg", list);
		log.info("list{}.",list);
		model.addAttribute("branchDto", branchDto);
		attr.addAttribute("branch_no", branch_no);
		return "admin/branch/detail";
	}
	
	//지점 이미지 다운로드
	@GetMapping("/imgdownload/{img_no}")
	@ResponseBody
	public ResponseEntity<ByteArrayResource> getImg(@PathVariable int img_no) throws Exception {
		ResponseEntity<ByteArrayResource> entity = branchService.getImg(img_no);
		return entity;
	}
	
	
	//지점 수정
	@GetMapping("/edit")
	public String edit(@RequestParam int branch_no,Model model,RedirectAttributes attr) {
		List<LocalDto> local = localDao.getList();
		List<BranchImgDto> list = branchService.getBranchImg(branch_no);
		model.addAttribute("branchImg", list);
		BranchDto branchDto = branchDao.get(branch_no);
		model.addAttribute("local", local);
		model.addAttribute("branchDto", branchDto);
		return "admin/branch/edit";
	}
	
	//지점 수정
	@PostMapping("/edit")
	public String edit(RedirectAttributes attr,@ModelAttribute BranchDto branchDto,@RequestParam List<MultipartFile> file) throws IllegalStateException, IOException {
		branchDao.edit(branchDto, file);
		attr.addAttribute("branch_no", branchDto.getBranch_no());
		return "redirect:detail";
	}
	
	//지점 삭제(일단 삭제는 되지만 고려해봐야 할 사항이 많음)
	@GetMapping("/delete")
	public String edit(@RequestParam int branch_no) {
		branchDao.delete(branch_no);
		return "redirect:list";
	}
	
	//지점별 회원 현황
	@GetMapping("/member_list")
	public String memberList(@RequestParam int branch_no,Model model) {
		List<MemberDto> list = branchDao.getMemberList(branch_no);
		model.addAttribute("list", list);
		return "admin/branch/member_list";
	}
	
	//지점 이미지 삭제
	@GetMapping("/deleteImg")
	public void deleteImg(@RequestParam int branch_img_no) {
		branchDao.deleteImg(branch_img_no);
	}
	
}
