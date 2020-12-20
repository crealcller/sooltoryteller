package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqCntVO;
import com.sooltoryteller.domain.LiqVO;

public interface LiqMapper {

	// 전통주 정보
	public LiqVO get(Long liqId);
	
	// 전통주 수정 
	public int update(LiqVO liq);
	
	// 전통주 상세 수정
	public int updateCn(LiqCnVO cn);

	// 전통주 전체 리스트
	public List<LiqVO> getAllLiqList(BbstCriteria cri);

	// 전통주 전체 리스트의 개수
	public int getCountLiqList();
	
	// 전통주 주종별 리스트의 개수
	public int getliqCnt();
	
	// for admin liq list
	public List<LiqVO> getLiqListWithPaging(AdminCriteria adCri);

	// 전통주의 주종별 리스트
	public List<LiqVO> getLiqListByCate(@Param("cate") String cate, @Param("cri") BbstCriteria cri);

	// 전통주 주종별 리스트의 개수
	public int getLiqCntByCate(String cate);

	// 전통주 등록
	public int insertLiq(@Param("liq") LiqVO liq, @Param("liqCoId") Long liqCoId);

	// 전통주 상세 등록
	public int insertLiqCn(LiqCnVO cn);

	// 전통주 count 등록
	public int insertLiqCnt(LiqCntVO cnt);

	// 전통주 삭제
	public int deleteLiq(Long liqId);

	// 전통주 상세 삭제
	public int deleteLiqCn(Long liqId);

	// 전통주 count 삭제
	public int deleteLiqCnt(Long liqId);

	// 리뷰수 업데이트
	public void updateRevwCnt(@Param("liqId") Long liqId, @Param("amount") int amount);

	// 평균평점 업데이트
	public int updateRevwRate(Long liqId);

	// 조회수 업데이트
	public void updateViewCnt(@Param("liqId") Long liqId, @Param("amount") int amount);

	// 좋아요수 업데이트
	public void updateLikeCnt(@Param("liqId") Long liqId, @Param("amount") int amount);
	
	public List<LiqVO> getOtherLiq(Long liqId);
}
