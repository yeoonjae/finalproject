import java.net.URI;
import java.net.URISyntaxException;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.finalproject.pay.KakaoPayResultVO;
import com.kh.finalproject.pay.KakaoPayStartVO;
import com.kh.finalproject.service.KakaoPayService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class test01 {

	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Test
	public void test() throws URISyntaxException {	
		KakaoPayStartVO startVO = KakaoPayStartVO.builder()								
				.partner_order_id("1")
				.partner_user_id("gPwjd@naver.com")
				.item_name("[스타벅스] 그린티 프라푸치노 모바일 쿠폰")
				.quantity(1)
				.total_amount(63000)
			.build();
		
		// 결제 요청 
		KakaoPayResultVO resultVO = kakaoPayService.prepare(startVO); 
		log.info("resultVO = {}",resultVO);
	}

}
