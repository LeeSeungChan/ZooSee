package org.kosta.zoosee.model.search;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.PetsitterboardVO;

public interface SearchDAO {

	public abstract List<PetsitterboardVO> findAllPetsitterList(HashMap<String,String> map);

	public abstract int petboardCount();

	public abstract int findAddressCount(String address);

}