package kr.co.admin.model.vo;

import java.util.ArrayList;

import kr.co.carpool.model.vo.Carpool;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminDashboard {
	private int sellerAppCount;
	private int newProductCount;
	private int newAdminChatCount;
	
	private int totalSalesAmount;
	private int todaySalesAmount;
	
	private int memberCount;
	private int lessonCount;
	private int houseCount;
	private int carpoolRecruitingCount;
	
	//private ArrayList<Integer> visitantList; //방문자수 현황
	private ArrayList<GenderRatio> genderRatio; //남녀 비율
	
	private ArrayList<Product> newProductList;
	private ArrayList<Member> newMemberList;
	
	private ArrayList<Member> newCarpoolDriverList;
	private ArrayList<SalesAmount> lessonSalesAmountList;//강습 판매금액 추이
	private ArrayList<SalesAmount> houseSalesAmountList;//숙박 판매금액 추이
	private ArrayList<SalesAmount> allSalesAmountList;//모든 판매금액 추이
	
	private ArrayList<Member> adminList;
}
