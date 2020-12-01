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
    private Long revwSeq;

    // 전통주 일련번호 
    private Long liqSeq;

    // 작성자 
    private String memberName;

    // 작성내용 
    private String revwCn;

    // 평점 
    private Integer revwRate;

    // 작성일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate;
    
    private MemberVO member;
}
