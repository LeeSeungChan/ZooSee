package org.kosta.zoosee.model.message;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.MessageVO;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Resource
	private MessageDAO messageDAO;
	
	@Override
	public int countMessage(String id){
		return messageDAO.countMessage(id);
	}

	@Override
	public ListVO getMessageList(String pageNo,String id) {
		if(pageNo==null||pageNo==""){
			pageNo="1";
		}
		HashMap<String ,String> map=new HashMap<String, String>();
		map.put("pageNo", pageNo);
		map.put("id", id);
		List<MessageVO> list = messageDAO.getMessageList(map);
		int total=messageDAO.getTotalMessage(id);
		PagingBean pagingBean = new PagingBean(total,Integer.parseInt(pageNo));
		ListVO listVO = new ListVO(list,pagingBean);
		return listVO;
	}

	@Override
	public MessageVO getMessageByNo(String message_no) {
		//메세지를 읽을때 checked값을 1로 변경해준다.
		MessageVO message = new MessageVO();
		message.setMessage_no(Integer.parseInt(message_no));
		message.setChecked(1);
		messageDAO.updateChecked(message);
		return messageDAO.getMessageByNo(message_no);
	}

	@Override
	public void updateCheckedAll(String id) {
		messageDAO.updateCheckedAll(id);
	}
	
	@Override
	public ListVO messageUncheckedList(String id,String pageNo) {
		System.out.println(id+pageNo);
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("id", id);
		if(pageNo==null){
			pageNo="1";
		}
		map.put("pageNo", pageNo);
		List<MessageVO> list=messageDAO.messageUncheckedList(map);
		System.out.println(list);
		int totalContent=messageDAO.countMessage(id);
		PagingBean pagingBean=new PagingBean(totalContent, Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}


}
