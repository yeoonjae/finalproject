package com.kh.finalproject.service;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.BranchImgDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class BranchServiceImpl implements BranchService {

	@Autowired
	private SqlSession sqlSession;

	// 이미지 다운로드
	public ResponseEntity<ByteArrayResource> getImg(int branch_img_no) throws Exception {
		BranchImgDto branchImgDto = sqlSession.selectOne("branchImg.getImg", branch_img_no);
		System.out.println(branchImgDto);
		if (branchImgDto == null) {
			return ResponseEntity.notFound().build();
		} else {
			File target = new File("D:/upload", String.valueOf(branch_img_no));
			// 여기다가 ㅏ이제 저 다운로드 코드 넣은담에 responseEntity 빤환하구 컨트롤러 한번 가주라
			byte[] data = FileUtils.readFileToByteArray(target);
			ByteArrayResource res = new ByteArrayResource(data);

			return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
					.contentLength(branchImgDto.getBranch_img_size())
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""
							+ URLEncoder.encode(branchImgDto.getBranch_img_name(), "UTF-8") + "\"")
					.header(HttpHeaders.CONTENT_ENCODING, "UTF-8").body(res);
		}

	}

	// 지점별 이미지 불러오기
	public List<BranchImgDto> getBranchImg(int branch_no) {
		List<BranchImgDto> list = sqlSession.selectList("branchImg.getBranchImg", branch_no);
		log.info("list[]",list);
		return list;
	}

}
