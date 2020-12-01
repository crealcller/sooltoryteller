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
	public LiqRevwVO get(Long revwSeq) {
		log.info("get...."+revwSeq);
		return mapper.read(revwSeq);
	}

	@Override
	public int modify(LiqRevwVO vo) {
		log.info("modify...."+vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long revwSeq) {
		log.info("remove........"+revwSeq);
		return mapper.delete(revwSeq);
	}

	@Override
	public List<LiqRevwVO> getList(Long liqSeq, Criteria cri) {
		log.info("get revw list "+liqSeq);
		return mapper.getListWithPaging(liqSeq, cri);
	}

	@Override
	public LiqRevwPageDTO getListPage(Long liqSeq, Criteria cri) {
		return new LiqRevwPageDTO(mapper.getCountByLiqSeq(liqSeq),mapper.getListWithPaging(liqSeq, cri));
	}

}
