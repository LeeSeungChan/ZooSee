package org.kosta.zoosee.model.member;


import java.util.List;

import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.vo.MemberVO;


public class ListVO {
	private List<MemberVO> list;
	private PagingBean pagingBean;
	
	public ListVO() {
		super();
		
	}

	public ListVO(List<MemberVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<MemberVO> getList() {
		return list;
	}

	public void setList(List<MemberVO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}










