package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.NoticeDto;

public interface NoticeDao {

	void write(NoticeDto noticeDto);

	List<NoticeDto> list();

	NoticeDto content(int notice_no);

	void edit(NoticeDto noticeDto);

	void delete(int notice_no);

}
