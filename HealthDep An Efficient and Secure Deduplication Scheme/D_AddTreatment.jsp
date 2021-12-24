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
.style53 {color: #FF0000}
.style54 {
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
        <div class="article">
          <h2 class="style53">Add Treatment Details !!!</h2>
          <p><span class="style37">Role : (Doctor)</span>
						
          </p>
          <p>&nbsp;</p>
          <table width="620" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
				%>
            <tr>
              <td width="30" height="30" bgcolor="#FF0000"><div align="center" class="style54"> ID </div></td>
              <td width="113" bgcolor="#FF0000"><div align="center" class="style54">Patient Name </div></td>
              <td width="85" bgcolor="#FF0000"><div align="center" class="style54">Hospital</div></td>
              <td width="119" bgcolor="#FF0000"><div align="center" class="style54">Details/File</div></td>
              <td width="72" bgcolor="#FF0000"><div align="center" class="style54">Disease </div></td>
              <td width="187" bgcolor="#FF0000"><div align="center" class="style54">Add Treatment Details </div></td>
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
					s7=rs.getString(12);
					
					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String s71 = new String(Base64.decode(s7.getBytes()));
					String s51 = new String(Base64.decode(s5.getBytes()));
					
					String query1="Select *from scheduled_patients where patient='"+s3+"' and  fname='"+s2+"' and doctor='"+doname+"' and status='Accepted' "; 
					Statement st1=connection.createStatement();
					ResultSet rs1=st1.executeQuery(query1);
					if ( rs1.next() )
					{
						%>
						<tr>
						<td height="28"><div align="center"><%=i%></div></td>
						<td><div align="center"><%=s3%></div></td>
						<td><div align="center"><%=s51%></div></td>
						<td><div align="center"><a href="D_Pat_Details.jsp?fname=<%=s2%>"><%=s2%></a></div></td>
						<td><div align="center"><%=s71%></div></td>
						<td bgcolor="#CCCCCC"><div align="center"><a href="D_Add_Treatment.jsp?fname=<%=s2%>" class="style53">Add Treatment Details </a></div></td>
						</tr>
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
