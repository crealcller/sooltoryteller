package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrdHistVO {

	// 주문이력 일련번호 
    private Long ordHistId;

    // 주문번호 
    private Long ordId;

    // 고객번호 
    private Long memberId;

    // 주문상태 
    private int ordStus;

    // 변경된 주문상태 
    private int chgOrdStus;

    // 변경된 주문상태일자 
    private Date chgOrdDate;
}
