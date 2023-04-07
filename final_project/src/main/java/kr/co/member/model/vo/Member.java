package kr.co.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private int memberGender;
	private String memberPhone;
	private String memberEmail;
	private int memberGrade;
	private String enrollDate;
	private String applicationDate;
	
}

