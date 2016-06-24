package org.kosta.zoosee.model.message;

import java.util.List;

import org.kosta.zoosee.model.message.PagingBean;
import org.kosta.zoosee.model.vo.MessageVO;

public class ListVO {
	private List<MessageVO> list;
	private PagingBean pagingBean;
	
	public ListVO() {
		super();
	}

	public ListVO(List<MessageVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<MessageVO> getList() {
		return list;
	}

	public void setList(List<MessageVO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	
	
}

