package com.kh.finalproject.repository;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface BranchImgDao {
	void regist(List<MultipartFile> file);
}
