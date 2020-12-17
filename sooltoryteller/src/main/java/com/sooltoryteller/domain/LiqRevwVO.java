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
	@NotBlank(message = "제목을 입력해주세요.")
	@Size(min = 10, max = 30, message = "최소 3자에서 최대 30자의 제목을 입력해주세요.") // 한글 기준인지 테스트해봐야 함
    private String cn;

    // 평점 
    private Integer rate;

    // 작성일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate;
    
    
    private MemberVO member;
    
}
