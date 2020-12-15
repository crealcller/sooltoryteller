package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 게시글 댓글
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbstReplyJoinVO {

	// 일련번호 
	@NotBlank
	private Long bbstReplyId;

	// 게시글 번호
	@NotBlank
	private Long bbstId;

	// 게시글 사진
	@NotBlank
	private String cnImg;
	
	// 회원ID
	@NotBlank
	private Long memberId;
	
	// 회원닉네임
	@NotBlank
	private String name; 
	
	// 회원 프로필사진
	private String img;

	// 댓글 내용 
	@NotBlank(message = "내용을 입력해주세요.")
	@Size(min = 2, max = 100, message = "최소 2자에서 최대 100자의 내용을 입력해주세요.") // 한글 기준인지 테스트해봐야 함
	private String replyCn;

	// 등록일시 
	private Date regdate;

	// 수정일시 
	private Date updatedate;

	// 조회수 
	private int inqrCnt;

	// 댓글수 
	private int replyCnt;

	// 좋아요수 
	private int likeCnt;
}
