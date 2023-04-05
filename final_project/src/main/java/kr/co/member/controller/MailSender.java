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
			
			msg.setFrom(new InternetAddress("eoekdl3@gmail.com","Lonly Suffers"));
			
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			msg.setSubject("Lonly suffers 이메일 인증","utf-8");
			
			msg.setContent("<h1>안녕하세요.</h1><h3>Lonly Suffers 입니다.</h3>"+"<h3>인증번호는 [<span style='color:red'>"+sb.toString()+"</span>]입니다</h3>","text/html;charset=utf-8");
			
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
