package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class LiqRevwPageDTO {

	private int revwCnt;
	private List<LiqRevwVO> list;
}
