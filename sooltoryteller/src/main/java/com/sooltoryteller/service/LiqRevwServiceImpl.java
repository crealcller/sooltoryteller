package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqRevwPageDTO;
import com.sooltoryteller.domain.LiqRevwVO;
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
	
	@Override
	public int register(LiqRevwVO vo) {
		log.info("register........."+vo);
		return mapper.insert(vo);
	}

	@Override
	public LiqRevwVO get(Long revwId) {
		log.info("get...."+revwId);
		return mapper.read(revwId);
	}

	@Override
	public int modify(LiqRevwVO vo) {
		log.info("modify...."+vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long revwId) {
		log.info("remove........"+revwId);
		return mapper.delete(revwId);
	}

	@Override
	public List<LiqRevwVO> getList(Long liqId, Criteria cri) {
		log.info("get revw list "+liqId);
		return mapper.getListWithPaging(liqId, cri);
	}

	@Override
	public LiqRevwPageDTO getListPage(Long liqId, Criteria cri) {
		return new LiqRevwPageDTO(mapper.getCountByLiqId(liqId),mapper.getListWithPaging(liqId, cri));
	}

}
