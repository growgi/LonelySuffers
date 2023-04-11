package kr.co.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatContent {
	
	private int chatContentNo;
	private int chatActiveNo;
	private String memberId;
	private String chatContent;
	private String chatDate;
	private int senderCheck;
}
