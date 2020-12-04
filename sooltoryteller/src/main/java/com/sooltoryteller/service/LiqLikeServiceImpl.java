package com.sooltoryteller.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.MyLikePageDTO;
import com.sooltoryteller.mapper.LiqLikeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LiqLikeServiceImpl implements LiqLikeService{

	@Setter(onMethod_ =@Autowired )
	private LiqLikeMapper mapper;

	@Override
	public boolean checkLike(Long memberId, Long liqId) {
		log.info("check like");
		return mapper.getCount(memberId, liqId) == 1;
	}
	
	@Override
	public boolean like(Long memberId, Long liqId) {
		log.info("like");
		return mapper.insert(memberId, liqId) ==1;
	}

	@Override
	public boolean cancelLike(Long memberId, Long liqId) {
		log.info("cancel like");
		return mapper.delete(memberId, liqId) == 1;
	}

	@Override
	public MyLikePageDTO getMyListWithPaging(Long memberId, Criteria cri) {
		log.info("get my list with paging");
		return new MyLikePageDTO(mapper.getCountMemberId(memberId),mapper.getMyListWithPaging(memberId, cri));
	}



}
