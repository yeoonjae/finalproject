package com.kh.finalproject.repository;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.VO.Criteria;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.BranchDeleteListDto;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.BranchImgDto;
import com.kh.finalproject.entity.MemberDto;

@Repository
public class BranchDaoImpl implements BranchDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private HttpSession session;
	
	//지점 등록 메소드
	public int regist(BranchDto branchDto,List<MultipartFile> file) throws IllegalStateException, IOException {
		int no = sqlSession.selectOne("branch.getSeq");//시퀀스 번호 미리생성
		branchDto.setBranch_no(no);
		branchDto.setBranch_layout("");
		sqlSession.insert("branch.regist", branchDto);
		//사진등록
		if(file.size() > 0 && !file.get(0).isEmpty()) {
			for(MultipartFile f : file) {
				//DB에 저장
				int img_no = sqlSession.selectOne("branchImg.getSeq");
				BranchImgDto branchImgDto = new BranchImgDto();
				branchImgDto.setBranch_img_no(img_no);
				branchImgDto.setBranch_img_name(Integer.toString(img_no));
				branchImgDto.setBranch_img_size(f.getSize());
				branchImgDto.setBranch_img_type(f.getContentType());
				branchImgDto.setBranch_no(no);
				sqlSession.insert("branchImg.regist", branchImgDto);
				
				//하드디스크에 저장
				File target = new File("D:/upload",Integer.toString(img_no));
				f.transferTo(target);
			}
		}
		return no;
	}

	//지점 리스트
	public List<BranchDto> getList() {
		List<BranchDto> list = sqlSession.selectList("branch.getList");
		return list;
	}

	//페이징+list
	public List<BranchDto> getList(Criteria cri) {
		return sqlSession.selectList("branch.getList",cri);
	}

	
	//배치도 등록
	public void layout_regist(String branch_layout, int branch_no) {
		Map<Object, Object> map = new HashMap<>();
		map.put("branch_layout", branch_layout);
		map.put("branch_no", branch_no);
		sqlSession.update("branch.layout_regist", map);
	}

	//지점 단일조회
	public BranchDto get(int branch_no) {
		BranchDto branchDto = sqlSession.selectOne("branch.get", branch_no);
		return branchDto;
	}

	//지점 수정
	public void edit(BranchDto branchDto,List<MultipartFile> file) throws IllegalStateException, IOException {
		sqlSession.update("branch.edit", branchDto);
		//사진등록
		if(file.size() > 0 && !file.get(0).isEmpty()) {
			for(MultipartFile f : file) {
				//DB에 저장
				int img_no = sqlSession.selectOne("branchImg.getSeq");
				BranchImgDto branchImgDto = new BranchImgDto();
				branchImgDto.setBranch_img_no(img_no);
				branchImgDto.setBranch_img_name(Integer.toString(img_no));
				branchImgDto.setBranch_img_size(f.getSize());
				branchImgDto.setBranch_img_type(f.getContentType());
				branchImgDto.setBranch_no(branchDto.getBranch_no());
				sqlSession.insert("branchImg.regist", branchImgDto);
				
				//하드디스크에 저장
				File target = new File("D:/upload",Integer.toString(img_no));
				f.transferTo(target);
			}
		}
	}
	
	// 지점 번호 조회
	@Override
	public List<Integer> getNo() {
		return sqlSession.selectList("branch.getNo");
	}
	
	// 지역별 지점번호 조회
	@Override
	public List<Integer> getNo2(int local_no) {
		return sqlSession.selectList("branch.getNo2", local_no);
	}

	//지점 삭제 메소드
	public void delete(int branch_no) {
		//삭제를 누를 시 expired_date 30일 뒤로 update
		sqlSession.update("branch.expiredUpdate", branch_no);
		//지점 삭제 목록 테이블에 insert하기
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int admin_no = adminDto.getAdmin_no();
		String branch_name=sqlSession.selectOne("branch.getNameToNo", branch_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("admin_no", admin_no);
		map.put("branch_no", branch_no);
		map.put("branch_name", branch_name);
		sqlSession.insert("branch.registDeleteList", map);
	}
	
	//지점장 번호로 지점번호 받아오기
	public int getNo3(int admin_no) {
		return sqlSession.selectOne("branch.getNo3", admin_no);
	}
	
	//지점별 회원 조회
	public List<MemberDto> getMemberList(int branch_no) {
		return sqlSession.selectList("branch.memberList", branch_no);
	}

	//지점 이미지 삭제
	public void deleteImg(@RequestParam int branch_img_no) {
		sqlSession.delete("branchImg.delete", branch_img_no);
		System.out.println("Test Controller 삭제완료");
	}

	//지점 리스트(이미지 같이)
	public List<BranchDto> getListWithImg() {
		return sqlSession.selectList("branch.getListWithImg");
	}

	//지점 이미지와 같이 단일조회
	public List<BranchDto> getWithImg(int branch_no) {
		return sqlSession.selectList("branch.getWithImg", branch_no);
	}

	// 지점명 조회
	public String getName(int branch_no) {
		return sqlSession.selectOne("branch.getBranchName", branch_no);
	}

	//지점 삭제 
	public List<BranchDeleteListDto> getDeleteList() {
		return sqlSession.selectList("branch.getDeleteList");
	}

	
	

}
