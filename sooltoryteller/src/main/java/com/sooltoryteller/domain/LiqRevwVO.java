package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

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
	@NotBlank(message = "리뷰내용을 작성해주세요.")
	@Size(min = 10, max = 500, message = "리뷰내용은 최소 10자에서 최대 500자까지 작성가능합니다.") // 한글 기준인지 테스트해봐야 함
    private String cn;

    // 평점 
    private Integer rate;

    // 작성일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate;
    
    
    private MemberVO member;
    
}
