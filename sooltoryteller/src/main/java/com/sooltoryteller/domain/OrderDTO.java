package com.sooltoryteller.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
public class OrderDTO {
		 private String name;
		 private String amount;
		 private String qty;
		 
		 public OrderDTO() {
			 this.name="술박스 그 외";
			 this.amount="10000";
			 this.qty="1";
		 }
}
