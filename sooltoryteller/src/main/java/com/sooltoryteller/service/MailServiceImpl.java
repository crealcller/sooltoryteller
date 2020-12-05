package com.sooltoryteller.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import com.sooltoryteller.domain.EmailVO;

public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender javaMailSender;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	@Override
	public void send(EmailVO email) {

		MimeMessage msg = javaMailSender.createMimeMessage();

		try {
			msg.setSubject(email.getTitle());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getTo()));

		} catch (MessagingException e) {
			e.printStackTrace();
		}

		try {
			javaMailSender.send(msg);
		} catch (MailException e) {
			e.printStackTrace();
		}

	}
}
