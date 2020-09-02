package com.kh.finalproject.restcontroller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.repository.BranchDao;

@RestController
@RequestMapping("/branch/rest")
public class LocalRestController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BranchDao branchDao;
	
	@GetMapping("/detail")
	public BranchDto detail(@RequestParam int branch_no,Model model) {
		BranchDto branchDto = branchDao.get(branch_no);
		model.addAttribute("branchDto", branchDto);
		return branchDto;
	}

}
