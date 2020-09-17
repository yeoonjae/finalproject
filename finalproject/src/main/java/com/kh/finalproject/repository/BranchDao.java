package com.kh.finalproject.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.VO.Criteria;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.BranchImgDto;
import com.kh.finalproject.entity.MemberDto;

public interface BranchDao {
	//지점 등록 메소드(지점 번호 반환)
	int regist(BranchDto branchDto,List<MultipartFile> file) throws IllegalStateException, IOException;
	//지점 리스트
	List<BranchDto> getList();
	
	//지점 리스트
	List<BranchDto> getList(Criteria cri);
	
	
	
	//배치도 등록
	void layout_regist(String branch_layout,int branch_no);
	//지점 단일조회
	BranchDto get(int branch_no);
	//지점 수정
	void edit(BranchDto branchDto,List<MultipartFile> file) throws IllegalStateException, IOException;
	//지점번호 조회
	List<Integer> getNo();
	//지역별 지점번호 조회
	List<Integer> getNo2(int local_no);
	//관리자별 지점번호 조회
	int getNo3(int admin_no);
	//지점 삭제
	void delete(int branch_no);
	//지점별 회원 조회

	List<MemberDto> getMemberList(int branch_no);
	//지점 이미지 삭제
	void deleteImg(int branch_img_no);
	//지점 리스트 이미지와 같이
	List<BranchDto> getListWithImg();
	//지점 단일조회(이미지 같이)
	List<BranchDto> getWithImg(int branch_no);

}
