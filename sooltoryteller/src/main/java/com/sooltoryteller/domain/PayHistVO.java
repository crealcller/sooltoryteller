package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayHistVO {

    // 결제이력 일련번호 
    private Long payHistId;

    // 결제 일련번호 
    private Long payId;

    // 변경전결제상태 
    private String bfStus;

    // 변경후결제상태 
    private String afStus;

    // 변경일 
    private Date chgDate;
}
