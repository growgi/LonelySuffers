package kr.co.member.controller;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.member.model.vo.Member;


@Component
@Aspect
public class PasswordEncAdvice {
	
	@Autowired
	private PasswordModul passEnc;
	
	@Pointcut(value = "execution(* kr.co.member.model.service.MemberService.*Member(kr.co.member.model.vo.Member))")
	private void encPointcut() {};
	
	@Pointcut(value = "execution(* kr.co.member.model.service.MemberService.updateMemberPw(..))")
	private void encPwPointcut() {};
	
	
	@Before(value = "encPointcut()")
	private void passwordEnc(JoinPoint jp)throws Exception {
		String methodName = jp.getSignature().getName();
		System.out.println("비밀번호 암호화 동작 메소드 : "+methodName);
		Object[] args = jp.getArgs();
		Member m = (Member)args[0];
		String memberPw = m.getMemberPw();
		System.out.println("암호화 동작 전 비밀번호 : "+memberPw);
		String encPw = passEnc.encData(memberPw);
		System.out.println("암호화 동작 후 비밀번호 : "+encPw);
		m.setMemberPw(encPw);
	}
	
	@Before(value = "encPwPointcut()")
	public void passPw(JoinPoint jp)throws Exception {
		String methodName = jp.getSignature().getName();
		System.out.println("비밀번호 암호화 동작 메소드 : "+methodName);
		Object[] args = jp.getArgs();
		Member member = (Member)args[0];
		String memberPwRe = (String)args[1];
		System.out.println("pw : "+member.getMemberPw());
		System.out.println("pwRe : "+memberPwRe);
		String encPw = passEnc.encData(member.getMemberPw());
		member.setMemberPw(encPw);
	}
	
}
