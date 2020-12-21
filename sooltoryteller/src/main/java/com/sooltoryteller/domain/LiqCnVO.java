package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LiqCnVO {
	
	// 전통주 일련번호 
    private Long liqId;

    // 소개 
    @NotNull(message = "소개는 공백일 수 없습니다.")
    @Size(min = 1,max = 500, message = "소개가 양식에 맞지않습니다.")
    private String intro;

    // 페어링 
    @Size(min = 0, max = 300, message = "페어링이 양식에 맞지않습니다.")
    private String pair;

    // 등록일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate;
}
