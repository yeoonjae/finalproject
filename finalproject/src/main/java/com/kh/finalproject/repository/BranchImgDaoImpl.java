//package com.kh.finalproject.repository;
//
//import java.io.File;
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.kh.finalproject.entity.BranchImgDto;
//
//public class BranchImgDaoImpl implements BranchImgDao{
//
//	@Autowired
//	private SqlSession sqlSession;
//	
//	//지점 이미지 등록 메소드
//	public void regist(List<MultipartFile> file) {
//		if(file.size() > 0 && !file.get(0).isEmpty()) {
//			for(MultipartFile f : file) {
//				int no = sqlSession.selectOne("branchImg.getSeq");
//				BranchImgDto branchImgDto = new BranchImgDto();
//				branchImgDto.setBranch_img_no(no);
//				branchImgDto.setBranch_img_name(Integer.toString(no));
//				branchImgDto.setBranch_img_size(f.getSize());
//				branchImgDto.setBranch_img_type(f.getContentType());
//				branchImgDto.setBranch_no(branch_no);
//				File target = new File("D:/upload");
//			}
//		}
//		
//	}
//
//}
