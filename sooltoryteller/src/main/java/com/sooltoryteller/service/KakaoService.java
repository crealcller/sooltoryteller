package com.sooltoryteller.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.sooltoryteller.domain.KakaoPayApprovalVO;
import com.sooltoryteller.domain.KakaoPayReadyVO;
import com.sooltoryteller.domain.OrderDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KakaoService {

	
	private static final String HOST ="https://kapi.kakao.com"; 
	
	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	private String userId = "";
	private String orderId = "";
	
	public String kakaoPayReady(OrderDTO orderDTO) {
		RestTemplate restTemplate = new RestTemplate();
		// 서버로 요청할 Header
		userId = orderDTO.getMemberId()+"";
		orderId =orderDTO.getOrderId()+"";
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "04b6bc56845b84db3c6f882f49ca1d47");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", orderId);
        params.add("partner_user_id", userId);
        params.add("item_name", orderDTO.getName());
        params.add("quantity", orderDTO.getTtlQty());
        params.add("total_amount", orderDTO.getTtlPrc());
        params.add("tax_free_amount", "0");	
        params.add("approval_url", "http://localhost:8181/shop/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8181/shop/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8181/shop/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            String url = kakaoPayReadyVO.getNext_redirect_pc_url();
            return url;
 
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
        params.add("partner_order_id", "");
        params.add("partner_user_id", userId);
        params.add("pg_token", pg_token);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
    }
	
}
