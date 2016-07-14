package org.kosta.zoosee.model.message;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.kosta.zoosee.model.vo.MessageVO;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
	@Resource
	private MessageDAO messageDAO;

	@Override
	public int countMessage(String id) {
		return messageDAO.countMessage(id);
	}

	@Override
	public ListVO getMessageList(String pageNo, String id) {
		if (pageNo == null || pageNo == "") {
			pageNo = "1";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pageNo", pageNo);
		map.put("id", id);
		List<MessageVO> list = messageDAO.getMessageList(map);
		int total = messageDAO.getTotalMessage(id);
		PagingBean pagingBean = new PagingBean(total, Integer.parseInt(pageNo));
		ListVO listVO = new ListVO(list, pagingBean);
		return listVO;
	}

	@Override
	public MessageVO getMessageByNo(String message_no) {
		// 메세지를 읽을때 checked값을 1로 변경해준다.
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
	public ListVO messageUncheckedList(String id, String pageNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		if (pageNo == null) {
			pageNo = "1";
		}
		map.put("pageNo", pageNo);
		List<MessageVO> list = messageDAO.messageUncheckedList(map);
		int totalContent = messageDAO.countMessage(id);
		PagingBean pagingBean = new PagingBean(totalContent,
				Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	public void sendMessageOnServer(String id, int when) {
		java.io.FileInputStream fi = null;
		try {
			/******* message sample 엑셀 경로 *******/
			// 2015.07.06
			// kosta -> kosta1
			fi = new java.io.FileInputStream(
					new java.io.File("C:\\Users\\kosta\\git\\zoosee\\zoosee_ver1\\src\\main\\webapp\\resources\\excel\\message.xls"));
			Workbook workbook = Workbook.getWorkbook(fi);
			Sheet sheet = workbook.getSheet(0); // 첫번째 시트를 얻어옴
			Cell b = null;
			Cell c = null;
			String title = "";
			String content = "";
			b = sheet.getCell(1,when);
			title = b.getContents();
			c = sheet.getCell(2,when);
			content = c.getContents();
			MessageVO message = new MessageVO();
			message.setTitle(title);
			message.setContent(content);
			message.setId(id);
			messageDAO.insertMessage(message);
		} catch (Exception e) {
			System.out.println("메세지 에러");
			e.printStackTrace();
		} finally {
			try {
				fi.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
