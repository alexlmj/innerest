package com.innerest.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;

import com.innerest.common.user.UserVO;


public class SimpleEmail {
	
	public static void sendWithHtml(UserVO user, String token) throws EmailException, IOException {
		  HtmlEmail email = new HtmlEmail();
		  email.setCharset("utf-8");
		  email.setHostName("smtp.googlemail.com");
		  email.setSmtpPort(465);
		  email.setAuthenticator(new DefaultAuthenticator("tmp99690", "q1w2e3r4t5!@#$"));
		  email.setSSLOnConnect(true);
		  
		  email.addTo(user.getEmail(), user.getName());
		  email.setFrom("tmp99690@gmail.com", "INNEREST");
		  email.setSubject("[INNEREST] 문의하신 계정 정보 입니다.");
		  
		  // embed the image and get the content id
		  //URL url = new URL("http://www.apache.org/images/asf_logo_wide.gif");
		  //String cid = email.embed(url, "Apache logo");
		  
		 // System.out.println(cid);
		  // set the html message
		  DefaultResourceLoader dl = new DefaultResourceLoader();
		  Resource resource = dl.getResource("classpath:findIdPw.html");
		  
		  File file = resource.getFile();
		  
		  BufferedReader br = new BufferedReader(new FileReader(file));
		  StringBuilder builder = new StringBuilder();
		  
		  String line="";
		  while((line = br.readLine())!=null) {
			  builder.append(line);
		  }
		  String html = builder.toString();

		  html = html.replace("[[id]]", user.getId());
		  html = html.replace("[[url]]", "http://localhost:8080/password?emailtoken="+token);
		  
		  email.setHtmlMsg(html);

		  // set the alternative message
		  email.setTextMsg("Your email client does not support HTML messages");
		  // send the email
		  email.send();
		  br.close();
	}
}
