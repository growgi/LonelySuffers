package kr.co.admin.model.vo;

import java.util.ArrayList;

import kr.co.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberPageData {
	
	private ArrayList<Member> memberList;
	private String pageNavi;
	private int start;

}
