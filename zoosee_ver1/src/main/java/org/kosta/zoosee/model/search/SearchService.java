package org.kosta.zoosee.model.search;

import java.util.List;

import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;

public interface SearchService {

	public abstract List<PetsitterboardVO> findAllPetsitterList(int pageNo,String address);
	public abstract int findAddressCount(String address);
	public abstract int petboardCount();

}