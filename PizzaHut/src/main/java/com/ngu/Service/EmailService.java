package com.ngu.Service;

import org.springframework.mail.SimpleMailMessage;

import com.ngu.Model.Mail;

public interface EmailService {

    public void SendEmail(SimpleMailMessage email);

	public void sendSimpleMessage(Mail mail);
}
