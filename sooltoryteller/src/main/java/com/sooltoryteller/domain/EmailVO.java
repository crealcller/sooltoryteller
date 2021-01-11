package com.sooltoryteller.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmailVO {

	private String title;
	private String content;
	private String to;
}
