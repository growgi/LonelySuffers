package kr.co.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchWithId {
	private String searchType;
	private String[] keywords;
	private String memberId;
}
