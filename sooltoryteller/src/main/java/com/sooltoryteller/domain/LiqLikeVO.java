package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LiqLikeVO {
	
	// 일련번호 
    private int liqLikeId;

    // 회원 
    private String memberId;

    // 좋아요 
    private Long liqId;

    // 등록일시 
    private Date regdate;

}
