package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqRevwPageDTO;
import com.sooltoryteller.domain.LiqRevwVO;
import com.sooltoryteller.domain.MyRevwPageDTO;
import com.sooltoryteller.mapper.LiqMapper;
import com.sooltoryteller.mapper.LiqRevwMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LiqRevwServiceImpl implements LiqRevwService {

	@Setter(onMethod_ = @Autowired)
	private LiqRevwMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private LiqMapper liqMapper;
	
	@Transactional
	@Override
	public int register(LiqRevwVO vo) {
		log.info("register........."+vo);
		
		int result = mapper.insert(vo);
		liqMapper.updateRevwCnt(vo.getLiqId(), 1);
		liqMapper.updateRevwRate(vo.getLiqId());
		liqMapper.updateRevwRate(vo.getLiqId());
		
		return result;
	}

	@Override
	public LiqRevwVO get(Long revwId) {
		log.info("get...."+revwId);
		
		return mapper.read(revwId);
	}
	
	@Transactional
	@Override
	public int modify(LiqRevwVO vo) {
		log.info("modify...."+vo);
		
		int result = mapper.update(vo);
		liqMapper.updateRevwRate(vo.getLiqId());
		
		return result;
	}

	@Transactional
	@Override
	public int remove(Long revwId) {
		log.info("remove........"+revwId);
		
		LiqRevwVO vo = mapper.read(revwId);
		Long liqId = vo.getLiqId();
		liqMapper.updateRevwCnt(liqId, -1);
		int result =  mapper.delete(revwId);
		liqMapper.updateRevwRate(liqId);
		
		return result;
	}

	@Override
	public List<LiqRevwVO> getList(Long liqId, Criteria cri) {
		log.info("get revw list "+liqId);
		
		return mapper.getListWithPaging(liqId, cri);
	}

	@Override
	public LiqRevwPageDTO getListWtihPaging(Long liqId, Criteria cri) {
		log.info("get list with paging");
		
		return new LiqRevwPageDTO(mapper.getCountByLiqId(liqId),mapper.getListWithPaging(liqId, cri));
	}

	@Override
	public MyRevwPageDTO getMyListWithPaging(Long memberId, Criteria cri) {
		log.info("get my list with paging");
		
		return new MyRevwPageDTO(mapper.getCountByMemberId(memberId),mapper.getMyListWithPaging(memberId, cri));
	}
}
