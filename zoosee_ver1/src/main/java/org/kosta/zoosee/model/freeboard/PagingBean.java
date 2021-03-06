package org.kosta.zoosee.model.freeboard;



public class PagingBean {
	/**
	 * 총 게시물 수 
	 */
	private int totalContent;
	public int getNowPage() {
		return nowPage;
	}
	/**
	 * 현재 페이지 넘버 
	 */
	private int nowPage=1;
	/**
	 * 한 페이지에서 보여줄 게시물 수 
	 */
	
	private int numberOfContentPerPage=5;
	/**
	 * 한 페이지 그룹내 페이지 수 
	 */
	
	private int numberOfPageGroup=4;
	
	public PagingBean() {
		super();
		
	}
	/**
	 * PagingBean을 통해 페이징 로직을 정의하기 위해서는 
	 * 전체 게시물 수와 현재 페이지 넘버를 필요로 한다. 
	 * @param totalContent
	 * @param nowPage
	 */
	public PagingBean(int totalContent, int nowPage) {
		super();
		this.totalContent = totalContent;
		this.nowPage = nowPage;

	}
	/**
	 * 총 페이지 수 리턴  
	 */
	public int getTotalPage(){
		int num=totalContent%this.numberOfContentPerPage;
		int totalPage=0;
		if(num==0)
			totalPage=totalContent/this.numberOfContentPerPage;
		else
			totalPage=totalContent/this.numberOfContentPerPage+1;
		return totalPage;
	}
	/**
	 * 전체 페이지 그룹수 리턴 
	 */
	public int getTotalPageGroup(){
		int num=this.getTotalPage()%this.numberOfPageGroup;
		int totalGroup=0;
		if(num==0)
			totalGroup=this.getTotalPage()/this.numberOfPageGroup;
		else
			totalGroup=this.getTotalPage()/this.numberOfPageGroup+1;
		return totalGroup;
	}
	/**
	 * 현재 페이지가 속한 페이지 그룹 번호를 리턴 
	 */
	public int getNowPageGroup(){
		int num=this.nowPage%this.numberOfPageGroup;
		int nowGroup=0;
		if(num==0)
			nowGroup=this.nowPage/this.numberOfPageGroup;
		else
			nowGroup=this.nowPage/this.numberOfPageGroup+1;
		return nowGroup;
	}
	/**
	 * 현재 페이지가 속한 페이지 그룹의 시작 페이지 번호를 리턴 
	 */
	public int getStartPageOfPageGroup(){
		//이전 페이지 그룹의 마지막 페이지 번호+1하면 시작 페이지가 됨
		int start=this.numberOfPageGroup*(this.getNowPageGroup()-1)+1;
		return start;
	}
	/**
	 * 현재 페이지가 속한 페이지 그룹의 마지막 페이지 번호를 리턴 
	 */
	public int getEndPageOfPageGroup(){
		int end=this.numberOfPageGroup*this.getNowPageGroup();
		if(end>this.getTotalPage()){
			end=this.getTotalPage();
		}
		return end;
	}
	/**
	 * 이전 페이지 그룹이 있는지 확인하여 있으면 true 없으면 false 
	 * 현재 페이지 그룹이 1보다 크면 true 
	 * @return
	 */
	public boolean isPreviousPageGroup(){
		boolean flag=false;
		if(this.getNowPageGroup()>1)
			flag=true;
		return flag;
	}
	/**
	 * 다음 페이지 그룹이 있는 지 확인 
	 * 현재 페이지 그룹이 전체 페이지 그룹 수보다 작으면 true
	 * @return
	 */
	public boolean isNextPageGroup(){
		boolean flag=false;
		if(this.getNowPageGroup()<this.getTotalPageGroup())
			flag=true;
		return flag;
	}	
}











