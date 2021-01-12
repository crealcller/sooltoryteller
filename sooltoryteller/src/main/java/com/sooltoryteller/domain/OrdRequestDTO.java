package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrdRequestDTO {

	private OrdVO ord;
	
	private String ordName;

	private List<OrdDtlVO> items;
	
	private OrdHistVO ordHist;

}