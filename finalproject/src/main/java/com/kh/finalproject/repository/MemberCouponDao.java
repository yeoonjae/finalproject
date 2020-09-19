package com.kh.finalproject.repository;

import com.kh.finalproject.entity.MemberCouponDto;

public interface MemberCouponDao {
	void regist(MemberCouponDto memberCouponDto);
	void delete(int coupon_no);

}
