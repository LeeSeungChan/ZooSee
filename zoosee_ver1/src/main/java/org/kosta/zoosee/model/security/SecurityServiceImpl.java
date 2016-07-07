package org.kosta.zoosee.model.security;

import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

@Repository
public class SecurityServiceImpl implements SecurityService
{
	@Resource
	private MemberDAO memberDAO;
	
	// 오버로딩.
	// 권한 insert 하는 부분.
	/* (non-Javadoc)
	 * @see org.kosta.zoosee.security.SecurityService#registerAuthorities(java.lang.String, java.lang.String)
	 */
	@Override
	public void registerAuthorities(String id, String autho)
	{
		HashMap<String,String> map = new HashMap<String,String>();
		String authority=null;
		map.put("id",id);
		if(autho==null || autho.equals(""))
		{
			authority = "ROLE_MEMBER";
			map.put("authority", authority);
		}
		else
		{
			map.put("authority", autho);
		}
		memberDAO.registerAuthorities(map);
	}
	
	// 권한 update
	/* (non-Javadoc)
	 * @see org.kosta.zoosee.security.SecurityService#updateAuthoties(java.lang.String, java.lang.String)
	 */
	@Override
	public void updateAuthoties(String id, String authority)
	{
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("username",id);
		map.put("authority", authority);
		int i = memberDAO.updateAuthoties(map);
		if(i==0)
		{
			throw new UsernameNotFoundException("회원님의 권한이 없습니다!");
		}
	}
}
