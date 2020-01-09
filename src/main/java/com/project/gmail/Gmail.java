package com.project.gmail;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Gmail {
    public static void gmailSendID(String name,String email,String id) {


        final String user = "chlwoaud1234@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        final String password = "WindowXP506@";   // 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

            // Subject
            message.setSubject("Cat & Dog에서 에서 고객님 정보 발송드립니다"); //메일 제목을 입력

            // Text
            message.setText(name+" 님의 아이디는: "+id+" 입니다!");    //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


    ////////////////임시비번 이메일
    public static void gmailSendPWD(String name,String email,String pwd) {
        final String user = "chlwoaud1234@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        final String password = "WindowXP506@";   // 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

            // Subject
            message.setSubject("Cat & Dog에서 에서 고객님 정보 발송드립니다"); //메일 제목을 입력

            // Text
            message.setText(name+" 님의 임시비밀번호입니다! : "+pwd+" 전대 타인에게 노출시키지마세요! 로그인후 비밀번호를 변경시켜주세요!");    //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
