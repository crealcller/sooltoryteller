package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.BasketVO;
import com.sooltoryteller.mapper.BasketMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BasketServiceImpl implements BasketService{
	
	@Setter(onMethod_ =@Autowired )
	private BasketMapper mapper;

	@Override
	public List<BasketVO> get(Long memberId) {
		log.info("get basket of memberId: "+memberId);
		return mapper.get(memberId);
	}
	
	

}
