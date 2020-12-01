package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.mapper.LiqMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LiqServiceImpl implements LiqService{

	private LiqMapper mapper;
	
	@Override
	public LiqVO get(Long liqSeq) {
		log.info("get..."+liqSeq);
		return mapper.get(liqSeq);
	}

	@Override
	public List<LiqVO> getAll() {
		log.info("getAll....");
		return mapper.getAll();
	}

	@Override
	public List<LiqVO> getAllByKind(String kind) {
		return mapper.getAllByKind(kind);
	}
}
