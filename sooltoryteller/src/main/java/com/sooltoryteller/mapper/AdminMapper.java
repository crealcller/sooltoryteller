package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCntVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.domain.MemberVO;

public interface AdminMapper {
	// 회원리스트 페이징처리
	public List<MemberVO> getListWithPaging(AdminCriteria adCri);

	// 모든회원의 수
	public int getTotalCount(AdminCriteria adCri);

	// 전통주 등록
	public int insertLiq(@Param("liq") LiqVO liq, @Param("liqCoId") Long liqCoId);

	// 전통주 상세 등록
	public int insertLiqCn(LiqCnVO cn);

	// 전통주 count 등록
	public int insertLiqCnt(LiqCntVO cnt);

	// 전통주 정보
	public LiqVO get(Long liqId);

	// 전통주 리스트
	public List<LiqVO> getLiqListWithPaging(AdminCriteria adCri);

	// 전통주 수정
	public int updateLiq(LiqVO liq);

	// 전통주 상세 수정
	public int updateCn(LiqCnVO cn);

	// 전통주 삭제
	public int deleteLiq(Long liqId);

	// 전통주 상세 삭제
	public int deleteLiqCn(Long liqId);

	// 전통주 count 삭제
	public int deleteLiqCnt(Long liqId);

	// 전통주 존재여부
	public int getliqExist(String liqNm);
	
	//양조장이름으로 양조장아이디 찾기
	public Long getLiqCoId(String liqCoNm);
	
	//양조장 등록
	public int insertLiqCo(LiqCoVO co);
	
	//양조장 업데이트
	public int updateLiqCo(LiqCoVO co);
	
	//양조장 삭세
	public int deleteLiqCo(Long liqCoId);
	
	//모든 양조장 리스트
	public List<LiqCoVO> getLiqCoListWithPaging(AdminCriteria adCri);
	
	//양조장아이디로 양조장 정보가져오기
	public LiqCoVO getLiqCoById(Long liqCoId);
	
	//등록된 양조장 개수
	public int liqCoCnt();
	
	//양조장 리스트
	public List<String> getCoNm();

}
