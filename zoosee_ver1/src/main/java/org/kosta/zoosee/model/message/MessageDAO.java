package org.kosta.zoosee.model.message;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.MessageVO;

public interface MessageDAO {

	public abstract int countMessage(String id);

	public abstract List<MessageVO> getMessageList(HashMap<String,String> map);

	public abstract int getTotalMessage(String id);

	public abstract MessageVO getMessageByNo(String message_no);

	public abstract void updateChecked(MessageVO message);

	public abstract void updateCheckedAll(String id);

	public abstract List<MessageVO> messageUncheckedList(
			HashMap<String, String> map);

	public abstract void insertMessage(MessageVO message);
}