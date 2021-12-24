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
<title><%=application.getAttribute("docname")%> (Doctor)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 23px}
.style37 {color: #FF0000; font-weight: bold; }
.style54 {
	font-size: 16px;
	color: #FF0000;
	font-weight: bold;
}
.style56 {font-size: 16px}
.style57 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style1"><span class="style3"><a href="index.html" class="style1">HealthDep An Efficient and Secure Deduplication Scheme for Cloud-Assisted eHealth Systems</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="D_Main.jsp">Hi <%=application.getAttribute("docname")%> !! (Doctor)</a></li>
          <li><a href="D_Login.jsp">Logout</a></li>
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
          <h2 class="style57">Add Treatment Details !!!</h2>
          <p><span class="style37">Role : (Doctor)</span></p>
          <p>&nbsp;</p>
          <p>
            <%			String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
			
						String doname = (String)application.getAttribute("docname");
						String id = request.getParameter("id");
						String disease = request.getParameter("disease");
						String treatment_cont = request.getParameter("textarea");
						String fname = request.getParameter("fname");
						
							String keys = "ef50a0ef2c3e3a5f";
		byte[] keyValue = keys.getBytes();
		Key key = new SecretKeySpec(keyValue, "AES");
		Cipher c = Cipher.getInstance("AES");
		c.init(Cipher.ENCRYPT_MODE, key);
		String encrypted_cont = new String(Base64.encode(treatment_cont.getBytes()));
						
						
				String query="Select *from scheduled_patients where fname='"+fname+"'  "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				if ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(8);
						
						String query1="update scheduled_patients set treatment_details='"+encrypted_cont+"' where id='"+id+"' "; 
						Statement st1=connection.createStatement();
						int rs1=st1.executeUpdate(query1);
						if ( rs1==1)
						{
							%> 
            <span class="style54">Treatment Details Added Sucessfully !!<br />
            </span> 
            <span class="style37"><%
						}
			  
				}
				else
				{
					%> 
            <span class="style56">Patient Not Scheduled.. Please Schedule Patient To Add Treatment Details !!</span></span> 
            <%
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
            
            
              </h3>
          </p>
          <p>&nbsp;</p>
          <p align="right"><a href="D_AddTreatment.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
			<li><a href="D_Main.jsp">Home</a></li>
			<li><a href="D_Login.jsp">Logout</a></li>
		  </ul>
        </div>
        <div class="gadget"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&nbsp;</p>
      <div class="clr"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
