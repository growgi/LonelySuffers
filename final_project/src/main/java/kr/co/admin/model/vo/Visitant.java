package kr.co.admin.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Visitant implements Serializable {
	private int visitantNo;
	private String visitantDate;
	
	private int dayTotal;
}
