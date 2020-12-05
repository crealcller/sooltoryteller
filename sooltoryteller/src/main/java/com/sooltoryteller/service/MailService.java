package com.sooltoryteller.service;

import com.sooltoryteller.domain.EmailVO;

public interface MailService {

	public void send(EmailVO email);
}
