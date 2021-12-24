<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=application.getAttribute("pname")%> (Patient)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 23px}
.style2 {	color: #FF0000;
	font-weight: bold;
}
.style30 {color: #000000}
.style28 {font-size: 18px}
.style33 {color: #4F7A8B}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style1">HealthDep An Efficient and Secure Deduplication Scheme for Cloud-Assisted eHealth Systems</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="P_Main.jsp">Hi <%=application.getAttribute("pname")%> !! (Patient)</a></li>
          <li><a href="P_Login.jsp">Logout</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div >
          <h2 class="style2">Upload Patient Details !!!</h2>
          <p><span class="style2">Role : (Patient)</span></p>
          <h3 class="infopost">
            <%
	try 
	{
		String file=request.getParameter("t42");
		String cont=request.getParameter("text2");
		String hospital=request.getParameter("hospital");
		String doctor=request.getParameter("doctor");
		String mac=request.getParameter("t4223");
		String disease=request.getParameter("disease");
		String age=request.getParameter("age");
		String bloodgroup=request.getParameter("bloodgroup");
		
		String pname=(String)application.getAttribute("pname");
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
      		String keys = "ef50a0ef2c3e3a5f";
		byte[] keyValue = keys.getBytes();
		Key key = new SecretKeySpec(keyValue, "AES");
		Cipher c = Cipher.getInstance("AES");
		c.init(Cipher.ENCRYPT_MODE, key);
		String dt1 = new String(Base64.encode(dt.getBytes()));
		
		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
				Cipher encoder = Cipher.getInstance("RSA");
				KeyPair kp = kg.generateKeyPair();
				Key pubKey = kp.getPublic();
				byte[] pub = pubKey.getEncoded();
				String pk = String.valueOf(pub);
		
	    String rank="0";
		
			if(doctor.equalsIgnoreCase("-Select-"))
			{
				%><br/>
              <span class="style25 style28">Please <span class="style33">Select Doctor</span> To Continue.. !!              </span>
              <%
			}
			else
			{
		
		Statement st=connection.createStatement();
		
		String strQuery2 = "insert into transaction(user,fname,task,dt) values('"+pname+"','"+file+"','Upload','"+dt+"')";
		st.executeUpdate(strQuery2);
		
		
		
	    st.executeUpdate("insert into  files(fname,ct,trapdoor,sk,rank,dt,patient,p_hospital,p_doctor,status,disease,age,bloodgroup) values ('"+file+"','"+cont+"','"+mac+"','"+pk+"','"+rank+"','"+dt1+"','"+pname+"','"+hospital+"','"+doctor+"','No','"+disease+"','"+age+"','"+bloodgroup+"')"); 
			
			st.executeUpdate("insert into  files_backup(fname,ct,trapdoor,sk,rank,dt,patient,p_hospital,p_doctor,status,disease,age,bloodgroup) values ('"+file+"','"+cont+"','"+mac+"','"+pk+"','"+rank+"','"+dt1+"','"+pname+"','"+hospital+"','"+doctor+"','No','"+disease+"','"+age+"','"+bloodgroup+"')"); 	
				
		%>
          </h3>
          <h3 >&nbsp;</h3>
          <h3 class="style28" >Details Uploaded Sucessfully !</h3>
          <p class="style30">&nbsp;</p>
          <%
		}
		connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          <p align="right"><a href="P_Upload.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
			<li><a href="P_Main.jsp">Home</a></li>
			<li><a href="P_Login.jsp">Logout</a></li>
		  </ul>
        </div>
        <div class="gadget"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
