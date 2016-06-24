package org.kosta.zoosee.model.message;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.MessageVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public int countMessage(String id){
		return template.selectOne("message.countMessage", id);
	}

	@Override
	public List<MessageVO> getMessageList(HashMap<String,String> map) {
		return template.selectList("message.getMessageList",map);
	}

	@Override
	public int getTotalMessage(String id) {
		return template.selectOne("message.getTotalMessage",id);
	}

	@Override
	public MessageVO getMessageByNo(String message_no) {
		return template.selectOne("message.getMessageByNo", message_no);
	}

	@Override
	public void updateChecked(MessageVO message) {
		template.update("message.updateChecked",message);
	}

	@Override
	public void updateCheckedAll(String id) {
		template.update("message.updateCheckedAll",id);
	}
	
	@Override
	public List<MessageVO> messageUncheckedList(HashMap<String, String> map) {
		return template.selectList("message.messageUncheckedList", map);
	}

	@Override
	public void insertMessage(MessageVO message) {
		template.insert("message.insertMessage",message);		
	}

}
