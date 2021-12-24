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
.style54 {font-size: 16px}
.style56 {color: #FFFF00; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1 align="justify"><a href="index.html" class="style1"><span class="style3"><a href="index.html" class="style1">HealthDep An Efficient and Secure Deduplication Scheme for Cloud-Assisted eHealth Systems</a></h1>
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
          <h2><span>Add Treatment Details </span>!!!</h2>
          <p><span class="style37">Role : (Doctor)</span></p>
          <%			String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
			
						String doname = (String)application.getAttribute("docname");
						String fname = request.getParameter("fname");
						
				String query="Select *from scheduled_patients where fname='"+fname+"'  "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				if ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(8);
					s4=rs.getString(9);
					

					
					
					String query1="Select *from files where fname='"+fname+"' and patient='"+s2+"'  "; 
					Statement st1=connection.createStatement();
					ResultSet rs1=st1.executeQuery(query1);
					if ( rs1.next() )
					{
					
					
						String Disease=rs1.getString(12);
						
						String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String Disease1 = new String(Base64.decode(Disease.getBytes()));
					
						%>
						<form id="form1" name="form1" method="post" action="D_Add_Treatment1.jsp">
						<table width="583" height="250" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
						<td bgcolor="#FF0000"><div align="left" class="style56">Patient Details : </div></td>
						<td width="395"  ><%=s2%></th>            </tr>
						<input type="hidden" name="id" value="<%=i%>" />
						<input type="hidden" name="fname" value="<%=fname%>" />
						<tr>
						<td bgcolor="#FF0000"><div align="left" class="style56">Patient Disease : </div></td>
						<td><%=Disease1%></td>
						<input type="hidden" name="disease" value="<%=Disease%>" />
						</tr>
						
						<tr>
						<td bgcolor="#FF0000" ><div align="left" class="style56">Enter Treatment Details : </div></td>
								<%						

						if(s4.equalsIgnoreCase("No"))
						{
							%><td><textarea name="textarea" cols="45" placeholder="Enter Treatment Details" rows="8"></textarea></td><%
						}
						else
						{
								String decrypted_cont = new String(Base64.decode(s4.getBytes()));
								
							%><td><textarea name="textarea" cols="45" rows="8"><%=decrypted_cont%></textarea></td><%
						}
								%>
						</tr>
						<tr>
						<td><div align="left"></div></td>
						<td>
						<label>
						<input type="submit" name="Submit" value="Add " />
						</label>						</td>
						</tr>
						</table>
						</form>
						<h3>
						<%
					}
			  
				}
				else
				{
					%> 
                      <span class="style54">Patient Not Scheduled.. Please Schedule Patient To Add Treatment Details !!</span> 
                      <%
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.print(e);
	}
%>
            
         
                    </h3>
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
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
