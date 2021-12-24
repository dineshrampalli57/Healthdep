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
<title>Cloud</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 23px}
.style3 {font-size: 18}
.style34 {
	color: #FF0000;
	font-weight: bold;
}
.style35 {
	font-size: 14px;
	color: #FFFF00;
	font-weight: bold;
}
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
          <li class="active"><a href="A_Main.jsp">Cloud</a></li>
          <li><a href="A_Login.jsp">Logout</a></li>
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
          <h2 class="style34">Doctor  Details !!!</h2>
          <p>&nbsp;</p>
          <table width="618" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
				%>
            <tr>
              <td width="33" height="30" bgcolor="#FF0000"><div align="center" class="style35"> ID </div></td>
              <td width="109" bgcolor="#FF0000"><div align="center" class="style35">Hospital</div></td>
              <td width="94" bgcolor="#FF0000"><div align="center" class="style35">Doctor</div></td>
              <td width="125" bgcolor="#FF0000"><div align="center" class="style35">Date </div></td>
              <td width="125" bgcolor="#FF0000"><div align="center" class="style35">Time </div></td>
              <td width="125" bgcolor="#FF0000"><div align="center" class="style35">Status </div></td>
            </tr>
            <%			
				String fname=request.getParameter("fname");

				String query="Select *from scheduled_patients where fname='"+fname+"' "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				if ( rs.next() )
				{
				
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(3);
					s4=rs.getString(4);
					s5=rs.getString(5);
					s6=rs.getString(6);
					s7=rs.getString(7);
					s8=rs.getString(8);	
					s9=rs.getString(9);					
									
					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String dt1 = new String(Base64.decode(s3.getBytes()));
					
					c.init(Cipher.ENCRYPT_MODE, key);
					String s51 = new String(Base64.encode(s5.getBytes()));
					String s61 = new String(Base64.encode(s6.getBytes()));
					%>
            <tr>
              <td height="28"><div align="center"><%=i%></div></td>
              <td><div align="center"><%=s4%></div></td>
              <td><div align="center"><%=s3%></div></td>
              <td><div align="center"><%=s51%></div></td>
              <td><div align="center"><%=s61%></div></td>
              <td><div align="center"><%=s7%></div></td>
            </tr>
          </table>
          <p>&nbsp;</p>
			
            <%if(!(s9.equalsIgnoreCase("No")))
			{
			%>
			<table width="486" height="114">
			<tr>
			<td width="202"><div align="center"><span class="style34">Treatment Details : </span></div></td>
			<td width="374"><textarea cols="45" rows="6" ><%=s9%></textarea></td>
			</tr>
		  </table>
			<%
			}
					
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          <p align="right"><a href="A_Main.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
			<li><a href="A_Main.jsp">Home</a></li>
			<li><a href="A_Login.jsp">Logout</a></li>
		  </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
        </div>
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
