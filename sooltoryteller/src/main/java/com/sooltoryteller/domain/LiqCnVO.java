package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LiqCnVO {
	// 전통주 일련번호 
    private Long liqSeq;

    // 소개 
    private String liqIntro;

    // 페어링 
    private String liqPair;

    // 등록일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate=null;
}
