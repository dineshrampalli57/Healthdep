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
.style64 {font-size: 18px}
.style65 {color: #4EA4BA}
.style66 {color: #FF0000}
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
          <h2><span>Schedule Status </span></h2>
          <p><span class="style37">Role : (Doctor)</span>
						
          </p>
          <p>&nbsp;</p>
		  <h3>
		    <%

try
{
	String docname=(String)application.getAttribute("docname");
	String id=request.getParameter("id");
	String pname=request.getParameter("pname");
	String sch_dt=request.getParameter("sch_dt");
	String sch_time=request.getParameter("sch_time");
	String hospital=request.getParameter("hospital");
	String fname=request.getParameter("fname");
	
	String sql="select *from files where id='"+id+"'";
	Statement s=connection.createStatement();
	ResultSet rs=s.executeQuery(sql);
	if(rs.next())
	{
		String stat=rs.getString(11);
		if(stat.equalsIgnoreCase("Scheduled"))
		{
			%>
				<span class="style64">Patient<span class="style66"> <%=pname%></span> <span class="style65">Already Scheduled </span> !<br /></span>
				<%
		}
		else
		{
			String msg="";
			Statement st=connection.createStatement();
			String query1="update files set status='Scheduled' where id='"+id+"'";
			st.executeUpdate(query1);
			
			String schdt=sch_dt+","+sch_time;
			Statement st2=connection.createStatement();
			String query12="insert into schedule_transaction (patient,doctor,fname,sch_dt,status)values('"+pname+"','"+docname+"','"+fname+"','"+schdt+"','Scheduled')";
			st2.executeUpdate(query12);
			
			Statement st1=connection.createStatement();
			String query2="insert into scheduled_patients(patient,doctor,hospital,sch_dt,sch_time,status,fname,treatment_details)values('"+pname+"','"+docname+"','"+hospital+"','"+sch_dt+"','"+sch_time+"','Scheduled','"+fname+"','No')";
			int r=st1.executeUpdate(query2);
			if(r==1)
			{
				%>
				<span class="style64">Patient<span class="style66"> <%=pname%></span> Scheduled Sucessfully On <span class="style66"> <%=sch_dt%></span> at<span class="style66"> <%=sch_time%></span> <br /> Please Wait for Patient To Accept the Scheduling To Add Treatment Details !</span>
				<%
			}
		}
	}
	connection.close();
}
catch(Exception e)
{
out.println(e);
}

%>
          </h3>
		  <p></p>
          <p align="right"><a href="D_SchedulePatients.jsp">Back</a></p>
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
