package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.MyLikeVO;
import com.sooltoryteller.domain.MyRevwVO;
import com.sooltoryteller.mapper.MyPageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService {

	@Setter(onMethod_ =@Autowired)
	private MyPageMapper mapper;
	
	@Override
	public List<MyRevwVO> getRevwList(Long memberId) {
		log.info(memberId+ ": get revw list");
		return mapper.getRevwList(memberId);
	}

	@Override
	public List<MyLikeVO> getLikeList(Long memberId) {
		log.info(memberId+ ": get like list");
		return mapper.getLikeList(memberId);
	}

}
