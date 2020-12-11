package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LiqNumsVO {

	 // 전통주 일련번호 
    private Long liqId;

    // 좋아요수 
    private Long likesNum;

    // 리뷰수 
    private Long revwNum;

    // 평균 평점 
    private double avgRate;

    // 조회수 
    private Long inqrNum;

    // 등록일시 
    private Date regdate;

    // 변경일시 
    private Date updatedate;
}
