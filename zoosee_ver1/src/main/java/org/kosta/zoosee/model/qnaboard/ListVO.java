package org.kosta.zoosee.model.qnaboard;

import java.util.List;

import org.kosta.zoosee.model.vo.QNABoardVO;
/**
 * 리스트 화면에 보여질 게시물 리스트와 <br>
 * 페이징 정보 객체를 저장하는 클래스
 * @author kosta-inst
 *
 */
public class ListVO {
	private List<QNABoardVO> list;
	private PagingBean pagingBean;
	
	public ListVO() {
		super();
	}
	public ListVO(List<QNABoardVO> list,
		      PagingBean pagingBean){
		this.list=list;
		this.pagingBean=pagingBean;
	}
	public List<QNABoardVO> getList() {
		return list;
	}
	public void setList(List<QNABoardVO> list) {
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
