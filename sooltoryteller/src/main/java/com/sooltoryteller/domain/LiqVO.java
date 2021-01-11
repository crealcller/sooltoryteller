package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LiqVO {

    // 전통주 일련번호 
    private Long liqId;

    // 양조장 일련번호 
    private Long LiqCoId;

    // 이름 
    @NotNull(message = "이름은 공백일 수 없습니다.")
    @Size(min = 1, max = 12, message = "이름이 양식에 맞지않습니다.")
    private String nm;
    
    //전통주 이미지
    //@NotNull(message = "이미지는 공백일 수 없습니다.")
    //@Size(min = 1, max = 200, message = "이미지가 양식에 맞지않습니다.")
   private String liqImg;
   
   //전통주 썸네일
    //@NotNull(message = "썸네일은 공백일 수 없습니다.")
    //@Size(min = 1, max = 200, message = "썸네일이 양식에 맞지않습니다.")
   private String liqThumb;

    // 주종 
    @NotNull(message = "주종은 공백일 수 없습니다.")
    @Size(min = 1, max = 6, message = "주종이 양식에 맞지않습니다.")
    private String cate;

    // 용량 
    private int capct;

    // 도수
    private float lv;

    // 원재료
    @Size(min =0, max = 60, message = "원재료가 양식에 맞지않습니다.")
    private String irdnt;

    // 수상내역 
    @Size(min =0, max = 90, message = "수상내역이 양식에 맞지않습니다.")
    private String ards;

    //가격
    private Long prc;
    
    // 등록일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate;
    
    //전통주 내용
    private LiqCnVO liqCn;
    
    //양조장
    private LiqCoVO liqCo;
    
    //전통주 카운트
    private LiqCntVO liqCnt;
    

   public String getCate() {
      return cate;
   }

   public void setCate(String cate) {
      this.cate = cate;
   }
}