package kr.co.admin.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductPageData {
	
	private ArrayList<Product> productList;
	private String pageNavi;
	private int start;
	private int totalCount;

}
