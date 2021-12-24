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
.style2 {color: #FF0000;font-weight: bold;}
.style21 {font-size:14px}
.style24 {color: #FF0000}
.style25 {color: #FFFFFF}
.style26 {
	font-size: 14px;
	color: #FFFFFF;
	font-weight: bold;
}
.style28 {color: #FFFF00; font-weight: bold; }
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
          <h2><span>View Scheduled Date and Time </span></h2>
          <p><span class="style2">Role : (Patient)</span></p>
          <p>&nbsp;</p>
          <table width="618" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
				%>
            <tr>
              <td width="33" height="30" bgcolor="#FF0000"><div align="center" class="style21 style25"><strong> ID </strong></div></td>
              <td width="109" bgcolor="#FF0000"><div align="center" class="style26">Hospital</div></td>
              <td width="94" bgcolor="#FF0000"><div align="center" class="style26">Doctor</div></td>
              <td width="125" bgcolor="#FF0000"><div align="center" class="style26">Date </div></td>
              <td width="125" bgcolor="#FF0000"><div align="center" class="style26">Time </div></td>
              <td width="125" bgcolor="#FF0000"><div align="center" class="style26">Status </div></td>
            </tr>
            <%			
				String pname=(String)application.getAttribute("pname");
				String fname=request.getParameter("fname");

				String query="Select *from scheduled_patients where patient='"+pname+"' and fname='"+fname+"' "; 
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
					String s41 = new String(Base64.decode(s4.getBytes()));
					
					%>
					<tr>
					  <td height="28"><div align="center"><%=i%></div></td>
					  <td><div align="center"><%=s41%></div></td>
					  <td><div align="center"><%=s3%></div></td>
					  <td><div align="center"><%=s5%></div></td>
					  <td><div align="center"><%=s6%></div></td>
						<%if(s7.equalsIgnoreCase("Scheduled")){%>
					  <td><div align="center"><a href="P_Accept_appointment.jsp?id=<%=i%>">Accept Appointment</a></div></td>
					  <%}else{%>
					  <td><div align="center"><%=s7%></div></td><%}%>
					</tr>
          </table>

<p>&nbsp;</p>

					  <%
					  	if(s7.equalsIgnoreCase("Accepted"))
						{
					  ResultSet rr=connection.createStatement().executeQuery("select * from bill where patient='"+s2+"' and doctor='"+s3+"' and fname='"+s8+"'");
					  if(rr.next())
					  {
					  	String bill_stat=rr.getString(7);
						if(bill_stat.equalsIgnoreCase("Paid"))
						{
							if(!(s9.equalsIgnoreCase("No")))
							{
												String s91 = new String(Base64.decode(s9.getBytes()));

							%>
							
							<table width="486" height="114">
							<tr>
							<td width="202" bgcolor="#FF0000"><div align="center"><span class="style28">Treatment Details : </span></div></td>
							<td width="374"><textarea cols="45" rows="6" ><%=s91%></textarea></td>
							</tr>
							</table>
							<%
							}
						}		
						else if(bill_stat.equalsIgnoreCase("Pending"))
						{
							%><h3 class="style24">Make the Payment To View The Treatment Details</h3>
							<br />
							<table width="486" height="114">
							<tr>
							<td width="202" bgcolor="#FF0000"><div align="center"><span class="style28">Treatment Details : </span></div></td>
							<td width="374"><textarea cols="45" rows="6" ><%=s9%></textarea></td>
							</tr>
							</table>
							<%
						}
						else
						{
								%>
							<h3 class="style24">Wait For Cloud To Generate Bill ..  To View The Treatment Details</h3>
							<br /><br /><%
						}
					}
						else
						{
								%><h3 class="style24">Wait For Cloud To Generate Bill ..  To View The Treatment Details</h3>
							<br /><br /><%
						}	
						
					}
					else
					{
						%><h3 class="style24">Accept the Scheduled Timings ..  To Get The Treatment Details From Doctor</h3>
							<br /><br /><%
					}	
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          <p align="justify">&nbsp;</p>
          <p align="right"><a href="P_ViewDetails.jsp"> Back</a></p>
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
