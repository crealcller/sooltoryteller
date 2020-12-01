package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LiqRevwVO {

	// 리뷰일련번호 
    private Long revwId;

    // 전통주 일련번호 
    private Long liqId;

    // 작성자 
    private Long memberId;

    // 작성내용 
    private String cn;

    // 평점 
    private Integer rate;

    // 작성일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate;
    
    private MemberVO member;
}
