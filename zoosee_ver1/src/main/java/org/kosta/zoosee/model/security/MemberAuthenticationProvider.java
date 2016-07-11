package org.kosta.zoosee.model.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.vo.Authority;
import org.kosta.zoosee.model.vo.MemberVO;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


/*
 * 전체 인증처리를 다 하고 자 할때 구현 한다.
 */

public class MemberAuthenticationProvider implements AuthenticationProvider{
	@Resource
	private MemberDAO memberDAO;
	@Override
	/*Authentication authenticate(Authentication authentication) throws AuthenticationException
	 * -실제 인증 처리
     *    - 규칙
     *     1. 파라미터로 전달받은 Authentication 객체에 대해 인증처리를 지원하지 않으면 null을 리턴한다.
     *     2. Authentication 객체를 이용한 인증에 실패하면 AuthenticationException 발생시킨다.
     *     3. 인증에 성공하면, 인증 정보를 담은 Authentication 객체를 만들어 return 한다.
	 */
	/**
	 * 매개변수 : 인증시 필요한 정보 - Authentication
	 * 리턴 : 인증한 정보를 가진 Authentication	 * 
	 * 매개변수 Authentication객체를 받아 인증처리를 한뒤 인증한 정보를 Authentication에 담아 리턴
	 */
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {		
		//1.파라미터로 전달받은 Authentication 객체에 대해 인증처리를 지원하지 않으면 null을 리턴한다.
		if(!supports(authentication.getClass())){
			return null;
		}
		//2.사용자 정보 디비로 부터 조회(UserDetailsService에서 했던 작업)
		String id = authentication.getName();//사용자가 로그인시 넘겨준 ID 조회
		MemberVO member = memberDAO.getMemberVO(id);
		if(member == null){
			throw new UsernameNotFoundException("회원 아이디가 존재하지 않습니다");
		}
		//3.패스워드 비교
		if(!authentication.getCredentials().equals(member.getPassword())){//패스워드가 틀리면
			throw new BadCredentialsException("패스워드가 틀립니다.");
		}
		//4.사용자 권한 조회
		List<Authority> list = memberDAO.selectAuthorityByUsername(id);
		if(list.size() == 0){//가입시 반드시 넣어주게 되어 있다면 필요 없음
			throw new UsernameNotFoundException("아무 권한이 없습니다.");
		}
		// 회원 이던 관리자이던 멤버에 해당하면 list로 넣어 권한설정을 해주는 SimpleGrantedAuthority 에 넣어줌.
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		for(Authority au : list){
			authorities.add(new SimpleGrantedAuthority(au.getAuthority()));
		}
		/****************************************
		 * 여기까지 왔으면 인증 완료 - Authentication객체 생성해서 리턴
		 ***************************************/
		Authentication auth = new UsernamePasswordAuthenticationToken(member, null, authorities);
		return auth;		
	}

	// default 로 설정한 메서드.
	// 신경 안써도 됨.
	@Override
	public boolean supports(Class<?> authentication) {
		//Class객체.isAssignableFrom(Class객체) 같은 타입의 객체를 담을 수 있는지 체크ㅡ - 둘이 같은 class로 부터 생성된 Class객체인지 체크
		return  UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}
