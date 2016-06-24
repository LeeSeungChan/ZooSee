package org.kosta.zoosee.model.search;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.springframework.stereotype.Service;

@Service
public class SearchServiceImpl implements SearchService
{
	@Resource
	public SearchDAO searchDAO;
	
	/* (non-Javadoc)
	 * @see org.kosta.zoosee.model.test.SearchTestService#findAllPetsitterList()
	 */
	@Override
	public List<PetsitterboardVO> findAllPetsitterList(int pageNo,String address)
	{
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("pageNo", String.valueOf(pageNo));
		map.put("address",address);
		return searchDAO.findAllPetsitterList(map);
	}

	@Override
	public int petboardCount() 
	{
		return searchDAO.petboardCount();
	}

	@Override
	public int findAddressCount(String address) 
	{
		return searchDAO.findAddressCount(address);
	}
}
