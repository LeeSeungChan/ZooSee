package org.kosta.zoosee.model.mail;

import org.springframework.mail.MailException;

public interface MailSenderService {

	public abstract String send(String email) throws MailException;

	public abstract String send(String id, String email) throws MailException;

}