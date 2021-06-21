package com.MK.sql;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MKmailtor extends Authenticator{

    public static String USERNAME = "";
    public static String PASSWORD = "";

    public MKmailtor() {
    }

    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(USERNAME, PASSWORD);
    }

}