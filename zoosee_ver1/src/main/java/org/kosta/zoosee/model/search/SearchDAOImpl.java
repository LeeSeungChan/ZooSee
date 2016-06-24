package org.kosta.zoosee.model.search;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAOImpl implements SearchDAO 
{
	@Resource
	private SqlSessionTemplate template;
	
	/* (non-Javadoc)
	 * @see org.kosta.zoosee.model.test.SearchTestDAO#findAllPetsitterList()
	 */
	@Override
	public List<PetsitterboardVO> findAllPetsitterList(HashMap<String,String> map)
	{
		return template.selectList("search.findAllPetsitterList",map);
	}

	@Override
	public int petboardCount() 
	{
		return template.selectOne("search.petboardCount");
	}

	@Override
	public int findAddressCount(String address) 
	{
		System.out.println(address);
		List<Integer> list = template.selectList("search.findAddressCount", address);
		int count = list.get(0);
		return count;
	}
}
