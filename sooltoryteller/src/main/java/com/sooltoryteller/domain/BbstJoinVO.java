package com.sooltoryteller.domain;

import java.util.Date;
//import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//게시판
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbstJoinVO {

	// 게시글 일련번호
	@NotBlank
	private Long bbstId;

	// 회원ID
	@NotBlank
	private Long memberId;

	// 회원닉네임
	@NotBlank
	private String name; 
	
	// 회원 프로필사진
	private String img;
	
	// 게시글 제목
	@NotBlank(message = "제목을 입력해주세요.")
	@Size(min = 3, max = 30, message = "최소 3자에서 최대 30자의 제목을 입력해주세요.") // 한글 기준인지 테스트해봐야 함
	private String title;

	// 게시글 사진
	@NotBlank
	private String cnImg;
	
	// 게시글 썸네일사진
	@NotBlank
	private String cnThumbimg;

	// 게시글 내용
	@NotBlank(message = "내용을 입력해주세요.")
	@Size(min = 5, max = 500, message = "최소 5자에서 최대 500자의 내용을 입력해주세요.") // 한글 기준인지 테스트해봐야 함
	private String cn;

	// 작성일시
	@NotBlank
	private Date regdate;

	// 변경일시
	@NotBlank
	private Date updatedate;
	
	// 조회수 
	private int inqrCnt = 0;

	// 댓글수 
	private int replyCnt = 0;

	// 좋아요수 
	private int likeCnt = 0;
}
