package com.MK.sql;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.MK.sql.MKmailtor;

public class MKmail {
    public String sendMail(String host, String to, String subject, String content)
            throws Exception {
        if (to != null){
            Properties props = System.getProperties();
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.auth", "true");
            MKmailtor auth = new MKmailtor();
            MKmailtor.USERNAME = "mkcell@126.com";
            MKmailtor.PASSWORD = "WVNUTDXVOOIWKNRA";
            Session session = Session.getInstance(props, auth);
            session.setDebug(true);
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("mkcell@126.com"));
                if (!to.trim().equals(""))
                    message.addRecipient(Message.RecipientType.TO,
                            new InternetAddress(to.trim()));
                    message.addRecipient(Message.RecipientType.CC,
                            new InternetAddress("mkcell@126.com".trim()));
                message.setSubject(subject);
                MimeBodyPart mbp1 = new MimeBodyPart();
                mbp1.setContent(content, "text/html;charset=utf-8");
                Multipart mp = new MimeMultipart();
                mp.addBodyPart(mbp1);

                message.setContent(mp);
                message.setSentDate(new Date());
                message.saveChanges();
                Transport sends = session.getTransport("smtp");
                sends.send(message);

            return "successful. Please check it to active your account!";
            } catch (Exception e){
                e.printStackTrace();
                return "failure, please wechat +86 18746004617 for help.";
            }
        }else{            
            return "failure, please wechat +86 18746004617 for help.";
        }
    }
}