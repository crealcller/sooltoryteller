package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 내 게시글 활동 현황
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyCntVO {

	private Long bCnt;
	private Long rCnt;
	private Long lCnt;
}
