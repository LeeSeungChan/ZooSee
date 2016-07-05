package org.kosta.zoosee.model.mail;

import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.kosta.zoosee.model.member.MemberService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailSenderServiceImpl implements MailSenderService
{
	//메일을 보내기 위한 api
	@Autowired
	JavaMailSender mailsender;
	
	@Resource
	MemberService memberService;
	
	/* (non-Javadoc)
	 * @see org.kosta.zoosee.model.mail.MailSenderService#send(java.lang.String)
	 */
	// 아이디 찾기.
	@Override
	public String send(String email) throws MailException 
	{
		String check="";
		MemberVO mvo = memberService.findEmailByMemberVO(email);
	    try 
	    {
	    	if(mvo == null){
				check = "fail";
			} else {
				MimeMessage message = mailsender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setSubject("[zoosee] 아이디 찾기 안내");
				String htmlContent = "안녕하세요, zoosee입니다.<br>";
				htmlContent += mvo.getName() + " 님의 " + " 아이디는<br> '" + mvo.getId() + "' 입니다";
				messageHelper.setText(htmlContent, true);
				messageHelper.setFrom("zooseekosta@gmail.com", "zoosee관리자");
				messageHelper.setTo(email);
				// messageHelper.addInline("abc", new
				// FileDataSource("abc.jpg"));
				mailsender.send(message);
			}
	    } catch (MailException e) {
	    	e.printStackTrace();
	    } catch (Throwable e) {
	        e.printStackTrace();
	    }
	    return check;
	}

	// 비밀번호 찾기.
	@Override
	public String send(String id, String email) throws MailException 
	{
		//MemberVO mvo = memberService.findPasswordByMemberVO(id,email);
		//임시 비밀번호를 만들어 보내줌.
		Random random = new Random();
		int password=0;
		String check="";
		 try{
			 for(int i=0; i<4; i++)
				{
					// 1~5 자리 까지 수를 없애기 위해 100000을 더함.
					password = random.nextInt(1000000)+100000;
					// 만약 10000이상이면 1000을 빼줌.
					if(password>1000000){
					    password = password - 100000;
					}
					//System.out.println(Integer.toString(password));
				}
				memberService.updateMemberPassword(id, password);
				MemberVO mvo = memberService.findPasswordByMemberVO(id,email);
				if(mvo==null)
				{
					check = "fail";
				}else{
		        	MimeMessage message = mailsender.createMimeMessage();
		            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		            messageHelper.setSubject("[zoosee] 비밀번호 찾기 안내");
		            String htmlContent = "안녕하세요, zoosee입니다.<br>";
		            htmlContent += mvo.getName()+" 님의 임시비밀번호 <br>"+"<h1>"+mvo.getPassword()+"</h1><br>";
		            htmlContent +="계정관리 ▶ 회원정보수정 의 경로로 가셔서 비밀번호를 바꿔주세요!";
		            messageHelper.setText(htmlContent, true);
		            messageHelper.setFrom("zooseekosta@gmail.com", "zoosee관리자");
		            messageHelper.setTo(email);
		            mailsender.send(message);
				}
	        } catch (MailException e) {
	            e.printStackTrace();
	        } catch (Throwable e) {
	            e.printStackTrace();
	        }
		 return check;
	}
	
}
