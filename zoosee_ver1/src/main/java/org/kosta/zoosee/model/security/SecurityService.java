package org.kosta.zoosee.model.security;

public interface SecurityService {

	// 오버로딩.
	// 권한 insert 하는 부분.
	public abstract void registerAuthorities(String id, String autho);

	// 권한 update
	public abstract void updateAuthoties(String id, String authority);

}