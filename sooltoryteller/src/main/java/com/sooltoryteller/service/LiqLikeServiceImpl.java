package com.sooltoryteller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.MyLikePageDTO;
import com.sooltoryteller.mapper.LiqLikeMapper;
import com.sooltoryteller.mapper.LiqMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LiqLikeServiceImpl implements LiqLikeService{

	@Setter(onMethod_ =@Autowired )
	private LiqLikeMapper mapper;
	
	@Setter(onMethod_ =@Autowired )
	private LiqMapper liqMapper;

	@Override
	public boolean checkLike(Long memberId, Long liqId) {
		log.info("check like");
		return mapper.getCount(memberId, liqId) == 1;
	}
	
	@Transactional
	@Override
	public boolean like(Long memberId, Long liqId) {
		log.info("like");
		liqMapper.updateLikeCnt(liqId, 1);
		return mapper.insert(memberId, liqId) ==1;
	}
	
	@Transactional
	@Override
	public boolean cancelLike(Long memberId, Long liqId) {
		log.info("cancel like");
		liqMapper.updateLikeCnt(liqId, -1);
		return mapper.delete(memberId, liqId) == 1;
	}

	@Override
	public MyLikePageDTO getMyListWithPaging(Long memberId, Criteria cri) {
		log.info("get my list with paging");
		return new MyLikePageDTO(mapper.getCountMemberId(memberId),mapper.getMyListWithPaging(memberId, cri));
	}



}

