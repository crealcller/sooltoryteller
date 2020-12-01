package com.sooltoryteller.domain;

import java.util.Date;
//import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

//게시판 
@Data
public class BbstMemberJoinVO {

	// 게시글 일련번호
	@NotBlank
	private Long bbstId;

	// 회원ID
	@NotBlank
	private String memberId;

	// 회원닉네임
	@NotBlank
	private String name; 
	
	// 게시글 제목
	@NotBlank(message = "제목을 입력해주세요.")
	@Size(min = 3, max = 30, message = "최소 3자에서 최대 30자의 제목을 입력해주세요.") // 한글 기준인지 테스트해봐야 함
	private String title;

	// 게시글 사진
	@NotBlank
	private String img;

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
	@NotBlank
	private int inqrNum = 0;

	// 좋아요수
	@NotBlank
	private int likesNum = 0;

	// 댓글수 
	@NotBlank
	private int replyNum = 0;

}
