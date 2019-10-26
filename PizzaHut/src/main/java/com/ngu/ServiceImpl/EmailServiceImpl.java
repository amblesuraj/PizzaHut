package com.ngu.ServiceImpl;

import com.ngu.Model.Mail;
import com.ngu.Service.EmailService;

import net.sf.jasperreports.engine.part.FinalFillingPrintPart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("emailService")
public class EmailServiceImpl implements EmailService
{
    @Autowired
    private JavaMailSender javaMailSender;

    @Async

    public void SendEmail(SimpleMailMessage email) {
        javaMailSender.send(email);
    }

    public void sendSimpleMessage(final Mail mail){
        
    	SimpleMailMessage message = new SimpleMailMessage();
        message.setSubject(mail.getSubject());
        message.setText(mail.getContent());
        message.setTo(mail.getTo());
        message.setFrom(mail.getFrom());

        javaMailSender.send(message);
    }	
}
