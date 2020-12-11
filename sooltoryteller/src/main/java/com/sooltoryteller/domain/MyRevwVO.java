package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//조인VO

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyRevwVO {

	// 전통주 일련번호 
    private Long liqId;
    
    // 전통주이름 
    private String nm;
    
	// 주종 
	private String cate;
    
    // 전통주 사진 
    private String img;

	// 리뷰일련번호 
    private Long revwId;
    
    // 작성내용 
    private String cn;

    // 평점 
    private Integer rate;

    // 작성일시 
    private Date regdate;


}
