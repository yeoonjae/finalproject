package com.kh.finalproject.service;

import com.kh.finalproject.entity.CouponDto;

public interface CouponService {

	void regist(int[] branch_no, int[] local_no, CouponDto couponDto);
}
