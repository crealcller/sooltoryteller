package com.sooltoryteller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.OrdRequestDTO;
import com.sooltoryteller.mapper.PayMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class PayserviceImpl implements PayService{
	
	@Setter(onMethod_ =@Autowired  )
	private PayMapper mapper;
	
	public boolean register(OrdRequestDTO ordRequest) {
		log.info("register pay and payHist");
		int payResult = mapper.insert(ordRequest.getPay());
		int payHistResult = mapper.insertPayHist(ordRequest.getPayHist());
		return payResult==1 && payHistResult==1;
	}


}
