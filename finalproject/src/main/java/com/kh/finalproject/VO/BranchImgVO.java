package com.kh.finalproject.VO;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BranchImgVO {
	private int branch_no;
	private int local_no;
	private int admin_no;
	private String branch_name;
	private long branch_size;
	private int branch_room_cnt;
	private int branch_seat_cnt;
	private int branch_locker_cnt;
	private String branch_layout;
	private List<MultipartFile> file;

	// 파일 유무를 반환하는 메소드
	public boolean isFileExist() {
		if (file == null) // 저장소가 존재하지 않으면 없다고 보겠다
			return false;

		if (file.size() < 1) // 파일 개수가 0개면 없다고 보겠다
			return false;

		if (file.get(0).isEmpty()) // 첫번째 파일이 비어있으면 없다고 보겠다
			return false;

		return true;

	}
}
