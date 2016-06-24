package org.kosta.zoosee.model.search;

import java.util.HashMap;

public class ListVO
{
	// PagingBean과 ArrayList<BoardVO> 를 넘겨줄 vo
	private HashMap map;
	private PagingBean pb;
	
	public ListVO() {
		super();
	}
	public ListVO(PagingBean pb) {
		super();
		this.pb = pb;
	}

	public ListVO(HashMap map) {
		super();
		this.map = map;
	}

	public ListVO(HashMap map, PagingBean pb) {
		super();
		this.map = map;
		this.pb = pb;
	}
	
	public HashMap getMap() {
		return map;
	}
	public void setMap(HashMap map) {
		this.map = map;
	}
	public PagingBean getPb()
	{
		return pb;
	}
	public void setPb(PagingBean pb)
	{
		this.pb = pb;
	}
	@Override
	public String toString()
	{
		return "ListVO [list=" + map + ", pb=" + pb + "]";
	}
	
}
