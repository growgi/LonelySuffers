package kr.co.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatActive {
	
	private int chatActiveNo;
	private String memberId;
	private int chatActivation;
}
