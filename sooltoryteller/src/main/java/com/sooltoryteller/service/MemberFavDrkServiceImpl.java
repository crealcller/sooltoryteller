package com.sooltoryteller.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.MemberFavDrkVO;
import com.sooltoryteller.mapper.MemberFavDrkMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j 
public class MemberFavDrkServiceImpl implements MemberFavDrkService{

	private MemberFavDrkMapper mapper;
	
	
	@Override
	public void registerFavDrk(Long memberId, int[] drink) {
		
		MemberFavDrkVO memberFavDrk = new MemberFavDrkVO();
		memberFavDrk.setMemberId(memberId);
		
		if(drink != null) {
			for(int i=0; i<drink.length; i++) {
				memberFavDrk.setDrkCdId(drink[i]);
				mapper.insert(memberFavDrk);
			}//for end
		}//if end
	}

	@Override
	public List<Integer> getFavDrk(Long memberId) {
		
		return mapper.get(memberId);
	}

	@Override
	public boolean modifyFavDrk(Long memberId, int[] drink) {
		MemberFavDrkVO memberFavDrk = new MemberFavDrkVO();
		List<Long> result = mapper.getFavDrkId(memberId);
		
		if(drink != null) {
			for(int i=0; i<drink.length; i++) {
				memberFavDrk.setFavDrkId(result.get(i));
				memberFavDrk.setDrkCdId(drink[i]);
				mapper.updateFavDrk(memberFavDrk);
				
				return true;
			}//for end
		}//if end
		return false;
	}

}
