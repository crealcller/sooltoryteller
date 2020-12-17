package com.sooltoryteller.domain;

import java.util.Date;
//import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 게시판 
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbstVO {

	// 게시글 일련번호
	private Long bbstId;

	// 회원ID
	private Long memberId;

	// 게시글 제목
	private String title;

	// 게시글 사진
	private String cnImg;
	
	// 게시글 썸네일사진
	private String cnThumbimg;

	// 게시글 내용
	private String cn;

	// 작성일시
	private Date regdate;

	// 변경일시
	private Date updatedate;
}
