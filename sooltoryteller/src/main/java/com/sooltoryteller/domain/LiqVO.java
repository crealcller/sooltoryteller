package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LiqVO {

    // 전통주 일련번호 
    private Long liqId;

    // 양조장 일련번호 
    private Long LiqCoId;

    // 이름 
    private String nm;
    
    //전통주 이미지
	private String liqImg;
	
	//전통주 썸네일
	private String liqThumb;

    // 주종 
    private String cate;

    // 용량 
    private int capct;

    // 도수 
    private float lv;

    // 원재료
    private String irdnt;

    // 수상내역 
    private String ards;

    // 등록일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate;
    
    //전통주 내용
    private LiqCnVO liqCn;
    
    //양조장
    private LiqCoVO liqCo;
    
    //전통주 카운트
    private LiqCntVO liqCnt;
    

}
