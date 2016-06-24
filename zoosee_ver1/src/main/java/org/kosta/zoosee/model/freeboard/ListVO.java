package org.kosta.zoosee.model.freeboard;


import java.util.List;

import org.kosta.zoosee.model.vo.FreeBoardVO;


public class ListVO {
	private List<FreeBoardVO> list;
	private PagingBean pagingBean;
	
	public ListVO() {
		super();
		
	}

	public ListVO(List<FreeBoardVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<FreeBoardVO> getList() {
		return list;
	}

	public void setList(List<FreeBoardVO> list) {
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










