package org.kosta.zoosee.model.petsitter;

import java.util.List;

import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.vo.PetsitterVO;
/**
 * 리스트 화면에 보여질 게시물 리스트와 <br>
 * 페이징 정보 객체를 저장하는 클래스
 * @author kosta-inst
 *
 */
public class ListVO {
	private List<PetsitterVO> list;
	private PagingBean pagingBean;
	
	public ListVO() {
		super();
	}
	public ListVO(List<PetsitterVO> list,
		      PagingBean pagingBean){
		this.list=list;
		this.pagingBean=pagingBean;
	}
	public List<PetsitterVO> getList() {
		return list;
	}
	public void setList(List<PetsitterVO> list) {
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
