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
    private Long liqSeq;

    // 양조장 일련번호 
    private Long liqCoSeq;

    // 이름 
    private String liqNm;

    // 가격 
    private int liqPrc;

    // 주종 
    private String liqCate;

    // 용량 
    private int liqCapct;

    // 도수 
    private int liqLv;

    // 원재료 
    private String liqIrdnt;

    // 수상내역 
    private String liqArds;

    // 전통주 사진 
    private String liqImg;

    // 등록일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate=null;
    
    //전통주 내용
    private LiqCnVO liqCn;
    //양조장
    private LiqCoVO liqCo;
}
