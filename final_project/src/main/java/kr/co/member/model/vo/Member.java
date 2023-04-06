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
	
	//1: 남자 2:여자
	public String getMaleFemale() {
		if(memberGender ==1) {
			return "남";
		}else {
			return "여";
		}
		
		//carpoolRequest.jsp 작업중
		//질문 : carpool에서 1,2 같은 숫자를 바꿔주는건 ok. 그런데 이제 member라는 조인된 테이블에서도 1,2를 가져와야하는데 오류가 뜸
	}
}

