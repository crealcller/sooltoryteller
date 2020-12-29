package com.sooltoryteller.service;

import java.util.ArrayList;
import java.util.Arrays;
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
	public void registerFavDrk(Long memberId, String[] arr) {
		
		MemberFavDrkVO memberFavDrk = new MemberFavDrkVO();
		memberFavDrk.setMemberId(memberId);
		
		
		int[] drink = new int[arr.length];
		
		for(int i=0;i<arr.length; i++){ 
			drink[i] = Integer.parseInt(arr[i]);
			
			}
		
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
			}//for end
			return true;
		}//if end
		return false;
	}

	@Override
	public List<String> getFavList(Long memberId) {
		
		return mapper.getFavList(memberId);
	}

	@Override
	public String[] getFavNameList(int[] arr) {
		
		String[] drink = new String[arr.length];
		System.out.println("service arr : " + arr);
		if(arr.length != 0) {
			for (int i = 0; i < arr.length; i++) {
				drink[i] = mapper.getFavNameList(arr[i]);
			}
		}
		
		System.out.println("service drink :" +Arrays.toString(drink));
		
		return drink;
	}

	@Override
	public int[] getFavCnt(int[] arr) {
		
		int[] drkCnt = new int[arr.length];
		
		if(arr.length != 0) {
			for (int i = 0; i < arr.length; i++) {
				drkCnt[i] = mapper.getFavCnt(arr[i]);
			}
		}
		
		System.out.println("service drink :" +Arrays.toString(drkCnt));
		
		return drkCnt;
	}


}
