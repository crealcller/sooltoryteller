package com.sooltoryteller.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.sooltoryteller.domain.KakaoPayApprovalVO;
import com.sooltoryteller.domain.KakaoPayReadyVO;
import com.sooltoryteller.domain.OrdRequestDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KakaoService {

	
	private static final String HOST ="https://kapi.kakao.com"; 
	
	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	@Setter(onMethod_ = @Autowired)
	private PayService payService;
	
	private Long userId = 0L;
	private Long orderId = 0L;
	private int ttlPrc = 0;
	
	public String kakaoPayReady(OrdRequestDTO ordRequest) {
		RestTemplate restTemplate = new RestTemplate();
		// 서버로 요청할 Header
		userId = ordRequest.getOrd().getMemberId();
		orderId =ordRequest.getOrd().getOrdId();
		ttlPrc = ordRequest.getOrd().getTtlPrc();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "04b6bc56845b84db3c6f882f49ca1d47");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", orderId+"");
        params.add("partner_user_id", userId+"");
        params.add("item_name", ordRequest.getOrdName());
        params.add("quantity", (ordRequest.getOrd().getTtlQty()+""));
        params.add("total_amount",ttlPrc+"");
        params.add("tax_free_amount", "0");	
        params.add("approval_url", "http://localhost:8181/shop/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8181/shop/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8181/shop/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            	//pay에 인서트한다
            	ordRequest.getPay().setOrdId(orderId);
            	ordRequest.getPay().setOrdPrc(ttlPrc);
            	ordRequest.getPayHist().setBfStus("P");
            	ordRequest.getPayHist().setAfStus("P");
            	payService.register(ordRequest);
            	
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return "/";
	}
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
		 
        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "04b6bc56845b84db3c6f882f49ca1d47");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", orderId +"");
        params.add("partner_user_id", userId +"");
        params.add("pg_token", pg_token);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            Date created_at = setDateFormat(kakaoPayApprovalVO.getCreated_at());
            Date approved_at = setDateFormat(kakaoPayApprovalVO.getApproved_at());
            
            kakaoPayApprovalVO.setCreated_at(created_at);
            kakaoPayApprovalVO.setApproved_at(approved_at);
            log.info("" + kakaoPayApprovalVO);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
    }
	//한국시긴
	private Date setDateFormat(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
        cal.add(Calendar.HOUR_OF_DAY, -9);
        return new Date(cal.getTimeInMillis());
	}
}
