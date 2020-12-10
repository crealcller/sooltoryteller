package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LiqVO {

    // 전통주 일련번호 
    private Long liqId;

    // 양조장 일련번호 
    private Long LiqCoId;

    // 이름 
    private String nm;

    // 가격 
    private int prc;

    // 주종 
    private String cate;

    // 용량 
    private int capct;

    // 도수 
    private int lv;

    // 원재료 
    private String irdnt;

    // 수상내역 
    private String ards;

    // 전통주 사진 
    private String img;

    // 등록일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate=null;
    
    //전통주 내용
    private LiqCnVO liqCn;
    //양조장
    private LiqCoVO liqCo;
    //전통주 카운트
    private LiqNumsVO liqNums;
}
