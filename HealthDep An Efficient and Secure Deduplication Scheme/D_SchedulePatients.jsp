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
.style49 {font-size: 14px}
.style51 {font-size: 14px; font-weight: bold; }
.style52 {color: #FFFFFF}
.style53 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style1"><a href="index.html" class="style1">HealthDep An Efficient and Secure Deduplication Scheme for Cloud-Assisted eHealth Systems</a></h1>
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
        <div>
          <h2><span>Schedule Patients </span>!!!</h2>
          <p><span class="style37">Role : (Doctor)</span>
						
          </p>
          <p>&nbsp;</p>
          <table width="556" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
				%>
            <tr>
              <td width="33" height="30" bgcolor="#FF0000"><div align="center" class="style49 style52"><strong> ID </strong></div></td>
              <td width="107" bgcolor="#FF0000"><div align="center" class="style49 style52"><strong>Patient Name </strong></div></td>
              <td width="109" bgcolor="#FF0000"><div align="center" class="style49 style52"><strong>Hospital</strong></div></td>
              <td width="152" bgcolor="#FF0000"><div align="center" class="style49 style52"><strong>Details/File</strong></div></td>
              <td width="143" bgcolor="#FF0000"><div align="center" class="style51 style52">Schedule Patient </div></td>
            </tr>
            <%
						String doname = (String)application.getAttribute("docname");

				String query="Select *from files where p_doctor='"+doname+"'  "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(8);
					s5=rs.getString(9);
					s6=rs.getString(11);
					
						String keys = "ef50a0ef2c3e3a5f";
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.DECRYPT_MODE, key);
      			String s51 = new String(Base64.decode(s5.getBytes()));
					
					%>
            <tr>
              <td height="28"><div align="center"><%=i%></div></td>
              <td><div align="center"><%=s3%></div></td>
              <td><div align="center"><%=s51%></div></td>
              <td><div align="center"><a href="D_Pat_Details.jsp?fname=<%=s2%>"><%=s2%></a></div></td>
				<%
				if(s6.equalsIgnoreCase("Scheduled"))
				{
					%><td bgcolor="#CCCCCC"><div align="center" class="style53">SCHEDULED</div></td>
				<%
				}
				else
				{
					%><td bgcolor="#333333"><div align="center"><a href="D_Schedule.jsp?fname=<%=s2%>" class="style52">SCHEDULE</a></div></td> <%
				}
				%>
            </tr>
            <%
			  
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          </table>
          <p></p>
          <p align="right"><a href="D_Main.jsp">Back</a></p>
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
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
