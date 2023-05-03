package kr.co.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.xml.internal.org.jvnet.mimepull.MIMEMessage;

@Component
public class MailSender {
	
	public String sendMail(String email) {
		boolean result = false;
		
		//이메일 통신 설정
		Properties prop = System.getProperties();
		//메일을 보내는 주체 gmail.com
		prop.put("mail.smtp.host", "smtp.gmail.com");
		//메일 보내는 port설정 587번 prot
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.auth", "true");
		//암호화통신 설정
		prop.put("mail.smtp.starttls.enable", "true");
		//tls버전 
		prop.put("maill.stmp.ssl.protocols", "TLSv1.2");
		//신뢰할수 있는 주소
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//이메일 정보
		Session session = Session.getDefaultInstance(prop,
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() { 
						PasswordAuthentication pa = new PasswordAuthentication("eoekdl3","tajezwgygkwivjqr");
						return pa;
						}
					}
				);
				
		MimeMessage msg = new MimeMessage(session);
		
		Random r = new Random();
		StringBuffer sb = new StringBuffer();
		for(int i=0 ; i<8;i++) {
			int flag = r.nextInt(3); //0:숫자 1:대문자 2:소문자
			if(flag == 0) {
				int rNo = r.nextInt(10);
				sb.append(rNo);
			}else if(flag == 1) {
				char ch = (char)(r.nextInt(26)+65);
				sb.append(ch);
			}else if(flag == 2) {
				char ch = (char)(r.nextInt(26)+97);
				sb.append(ch);
			}
		}
		
		
		try {
			
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("eoekdl3@gmail.com","Lonely surfers"));
			
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			msg.setSubject("Lonely surfers 이메일 인증","utf-8");
			
			
			msg.setContent("<table style='width: 720px; margin: 0 auto; border-top: 6px solid #0eb6e6; border-left: 1px solid #dfdfdf; border-right: 1px solid #dfdfdf; border-bottom: 1px solid #dfdfdf; box-sizing: border-box; border-collapse: collapse; border-spacing: 0; background: #ffffff; font-family: dotum, '돋움', sans-serif'>	<tbody><tr><td height='25' colspan='3'></td></tr><tr><td width='30' style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td><td width='630' height='100px'style='margin: 0; padding: 0; font-size: 50px ; line-height: 0; color : #0eb6e6; font-weight : 600;'>Lonely surfers</td><td style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td><td style='margin: 0; padding: 0; font-size: 0; line-height: 0'><table cellspacing='0' cellpadding='0' border='0'style='width: 100%'><tbody><tr><td height='40'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='margin: 0; padding: 0; font-size: 14px; line-height: 21px; color: #444; font-weight: 700'>안녕하세요!</td>	</tr><tr><td height='20'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='font-size: 12px; color: #444444; line-height: 21px; margin: 0; padding: 0'>이메일은 Lonely surfers에 등록하신 귀하의 이메일을 인증하기 위해 전송되었습니다.<br>아래 인증번호를 입력해서 이메일 인증을 완료해주세요.</td></tr><tr><td height='35'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='line-height: 12px;font-size: 20px'><span style='font-size: 30px;font-weight: 600;'>[&nbsp;&nbsp;</span><span style='font-size: 30px; color: red; font-weight: 600;'>"+sb.toString()+"</span><span style='font-size: 30px;font-weight: 600;'>&nbsp;&nbsp;]</span></td></tr><tr><td height='37'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='font-size: 12px; color: #444444; line-height: 21px; marin: 0; padding: 0'>인증메일 유효시간은 <strong>메일 수신일 기준 24시간</strong> 이내입니다.<br> 이메일 인증 완료 후에는 아이디/비밀번호 찾기 시 이메일 정보로 확인이 가능합니다.<br> <br>감사합니다.</td></tr><tr><td height='80'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr></tbody></table></td><td style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='vertical-align: middle; font-family: dotum' colspan='3'><table width='718'style='margin: 0; background: #f9f9f9; overflow: hidden; text-align: left'><tbody><tr><td width='400px' style='padding: 19px 0 17px 0; text-align: center'></td><td width='550'style='margin: 0; padding: 36px 0 32px 0; font-family: dotum, sans-serif; font-size: 11px; line-height: 18px; color: #999'>㈜Lonely surfers<span style='margin: 0; padding: 0 8px; color: #d7d7d7'>|</span>서울 영등포구 선유동2로 57 이레빌딩(구관) 19F,20F<br>사업자등록번호:123-45-7890<span style='margin: 0; padding: 0 8px; color: #d7d7d7'>|</span>통신판매업신고:2023-서울영등-01234<br>개인정보보호책임자 플랫폼사업본부 홍길동 본부장<span style='margin: 0; padding: 0 8px; color: #d7d7d7'>|</span>문의전화:010-5669-8920<br>COPYRIGHT©Lonely surfers CORP ALL RIGHTS RESERVED.</td></tr></tbody></table></td></tr></tbody></table>","text/html;charset=utf-8");
			
			Transport.send(msg);
			result = true;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result) {
			return sb.toString();
		}else {
			return null;
		}
		
	}
	
	public String sendPw(String email) {
		boolean result = false;
		
		//이메일 통신 설정
		Properties prop = System.getProperties();
		//메일을 보내는 주체 gmail.com
		prop.put("mail.smtp.host", "smtp.gmail.com");
		//메일 보내는 port설정 587번 prot
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.auth", "true");
		//암호화통신 설정
		prop.put("mail.smtp.starttls.enable", "true");
		//tls버전 
		prop.put("maill.stmp.ssl.protocols", "TLSv1.2");
		//신뢰할수 있는 주소
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//이메일 정보
		Session session = Session.getDefaultInstance(prop,
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() { 
						PasswordAuthentication pa = new PasswordAuthentication("eoekdl3","tajezwgygkwivjqr");
						return pa;
						}
					}
				);
				
		MimeMessage msg = new MimeMessage(session);
		
		Random r = new Random();
		StringBuffer sb = new StringBuffer();
		for(int i=0 ; i<8;i++) {
			int flag = r.nextInt(3); //0:숫자 1:대문자 2:소문자
			if(flag == 0) {
				int rNo = r.nextInt(10);
				sb.append(rNo);
			}else if(flag == 1) {
				char ch = (char)(r.nextInt(26)+65);
				sb.append(ch);
			}else if(flag == 2) {
				char ch = (char)(r.nextInt(26)+97);
				sb.append(ch);
			}
		}
		
		
		try {
			
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("eoekdl3@gmail.com","Lonely surfers"));
			
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			msg.setSubject("Lonely surfers 임시비밀번호","utf-8");
			
			msg.setContent("<table style='width: 720px; margin: 0 auto; border-top: 6px solid #0eb6e6; border-left: 1px solid #dfdfdf; border-right: 1px solid #dfdfdf; border-bottom: 1px solid #dfdfdf; box-sizing: border-box; border-collapse: collapse; border-spacing: 0; background: #ffffff; font-family: dotum, '돋움', sans-serif'>	<tbody><tr><td height='25' colspan='3'></td></tr><tr><td width='30' style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td><td width='630' height='100px'style='margin: 0; padding: 0; font-size: 50px ; line-height: 0; color : #0eb6e6; font-weight : 600;'>Lonely surfers</td><td style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td><td style='margin: 0; padding: 0; font-size: 0; line-height: 0'><table cellspacing='0' cellpadding='0' border='0'style='width: 100%'><tbody><tr><td height='40'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='margin: 0; padding: 0; font-size: 14px; line-height: 21px; color: #444; font-weight: 700'>안녕하세요!</td>	</tr><tr><td height='20'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='font-size: 12px; color: #444444; line-height: 21px; margin: 0; padding: 0'>이메일은 Lonely surfers에 등록하신 귀하의 이메일에 임시비밀번호를 위해 전송되었습니다.<br>아래 임시비밀번호를 입력해서 로그인후 비밀번호 변경을 완료해주세요.<br></td></tr><tr><td height='35'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='line-height: 12px;font-size: 20px'><span style='font-size: 30px;font-weight: 600;'>[&nbsp;&nbsp;</span><span style='font-size: 30px; color: red; font-weight: 600;'>"+sb.toString()+"</span><span style='font-size: 30px;font-weight: 600;'>&nbsp;&nbsp;]</span></td></tr><tr><td height='37'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='font-size: 12px; color: #444444; line-height: 21px; marin: 0; padding: 0'>임시비밀번호 유효시간은 <strong>메일 수신일 기준 24시간</strong> 이내입니다.<br> 임시 비밀번호로 로그인 후에는 비밀번호를 변경해 주시길 바랍니다.<br> <br>감사합니다.</td></tr><tr><td height='80'style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr></tbody></table></td><td style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td></tr><tr><td style='vertical-align: middle; font-family: dotum' colspan='3'><table width='718'style='margin: 0; background: #f9f9f9; overflow: hidden; text-align: left'><tbody><tr><td width='400px' style='padding: 19px 0 17px 0; text-align: center'></td><td width='550'style='margin: 0; padding: 36px 0 32px 0; font-family: dotum, sans-serif; font-size: 11px; line-height: 18px; color: #999'>㈜Lonely surfers<span style='margin: 0; padding: 0 8px; color: #d7d7d7'>|</span>서울 영등포구 선유동2로 57 이레빌딩(구관) 19F,20F<br>사업자등록번호:123-45-7890<span style='margin: 0; padding: 0 8px; color: #d7d7d7'>|</span>통신판매업신고:2023-서울영등-01234<br>개인정보보호책임자 플랫폼사업본부 홍길동 본부장<span style='margin: 0; padding: 0 8px; color: #d7d7d7'>|</span>문의전화:010-5669-8920<br>COPYRIGHT©Lonely surfers CORP ALL RIGHTS RESERVED.</td></tr></tbody></table></td></tr></tbody></table>","text/html;charset=utf-8");
			Transport.send(msg);
			result = true;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result) {
			return sb.toString();
		}else {
			return null;
		}
		
	}
}
