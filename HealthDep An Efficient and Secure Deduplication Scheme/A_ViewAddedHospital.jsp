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
<title>Admin </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 23px}
.style2 {color: #4b4b4b}
.style3 {font-size: 18}
.style24 {
	color: #FF0000;
	font-weight: bold;
}
.style25 {
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
          <h2 class="style24">Add Hospital &amp; Department </h2>
          <p>&nbsp;</p>

            <%	  
			  
			  
			  
		String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
		int i=0,j=0,k=0,l=0;
		try 
		{
			 %>  
			 <table width="500" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <tr>
              <td width="186" height="30" bgcolor="#FF0000"><div align="center" class="style25"> ID </div></td>
              <td width="308" bgcolor="#FF0000"><div align="center" class="style25"> Hospital  Name </div></td>
              <%
			String query="select * from hospital"; 
			Statement st=connection.createStatement();
			ResultSet rs=st.executeQuery(query);
			while ( rs.next() )
			{
				i=rs.getInt(1);
				s2=rs.getString(2);
				
				%>
			   </tr>
					<tr>
					<td height="28"><div align="center"><%=i%></div></td>
					<td><div align="center"><%=s2%></div></td>
					</tr>
		  <%
				
			}
						%></table>
          <p class="style2">&nbsp;</p>
          <p class="style2">&nbsp;</p>
						<%

			 %>  <table width="500" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <tr>
              <td width="185" height="30" bgcolor="#FF0000"><div align="center" class="style25"> ID </div></td>
              <td width="309" bgcolor="#FF0000"><div align="center" class="style25">Department Name </div></td>
              <%
			String query1="select * from department"; 
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(query1);
			while ( rs1.next() )
			{
				l=rs1.getInt(1);
				s3=rs1.getString(2);
				
				%>
					</tr>
					<tr>
					<td height="28"><div align="center"><%=l%></div></td>
					<td><div align="center"><%=s3%></div></td>
					</tr>
					<%
			}
			%></table>
						<%
			
					
		connection.close();
		}
		catch(Exception e)
		{
		out.println(e.getMessage());
		}
%>
          <p class="style2">&nbsp;</p>
          <p align="right"><a href="A_AddHospital.jsp">Back</a></p>
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
