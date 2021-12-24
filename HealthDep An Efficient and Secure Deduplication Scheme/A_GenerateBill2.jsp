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
.style26 {color: #4b4b4b; font-weight: bold; }
.style64 {font-size: 18px}
.style65 {color: #4EA4BA}
.style66 {color: #FF0000}
.style3 {font-size: 18}
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
          <li class="active"><a href="A_Main.jsp">CloudServer</a></li>
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
        <div>
          <h2><span>Generate Bill </span></h2>
          <p>&nbsp;</p>
            <%

try
{
	String id=request.getParameter("id");
	String pname=request.getParameter("pname");
	String dname=request.getParameter("dname");
	String fname=request.getParameter("fname");
	String sch_dt=request.getParameter("sch_dt");
	String treatment=request.getParameter("treatment");
	String amount=request.getParameter("amount");
	
	String sql="select *from bill where patient='"+pname+"' and doctor='"+dname+"' and fname='"+fname+"'";
	Statement s=connection.createStatement();
	ResultSet rs=s.executeQuery(sql);
	if(rs.next())
	{
		String stat=rs.getString(6);
		if(stat.equalsIgnoreCase("Pending"))
		{
			%>
            <span class="style64">Please Wait For <span class="style66"> <%=pname%></span>  To Pay <span class="style65">Bill </span> !<br />
            </span>
            <%
		}
		else if(stat.equalsIgnoreCase("Cleared"))
		{
		
			%>
            <span class="style64">Patient : <span class="style66"> <%=pname%></span>Has Cleared The Pending Bill !<br />
            </span>
            <%
		}
		else
		{
			
			
			Statement st1=connection.createStatement();
			String query2="insert into bill(patient,doctor,fname,sch_dt,amount,status)values('"+pname+"','"+dname+"','"+fname+"','"+sch_dt+"','"+amount+"','Pending')";
			int r=st1.executeUpdate(query2);
			if(r==1)
			{
				%>
            <span class="style64">Bill Generated With Amount of :<span class="style66"> <%=amount%></span> For the Patient With Details/File : <span class="style66"> <%=fname%></span> !</span>
            <%
			}
		}
	}
	else
		{
			
			
			Statement st1=connection.createStatement();
			String query2="insert into bill(patient,doctor,fname,sch_dt,amount,status)values('"+pname+"','"+dname+"','"+fname+"','"+sch_dt+"','"+amount+"','Pending')";
			int r=st1.executeUpdate(query2);
			if(r==1)
			{
				%>
            <span class="style64">Bill Generated With Amount of :<span class="style66"> <%=amount%></span> For the Patient : <span class="style66"> <%=pname%></span> With Details/File : <span class="style66"> <%=fname%></span> !</span>
            <%
			}
		}
	connection.close();
}
catch(Exception e)
{
out.println(e);
}

%>
<p>&nbsp;</p>
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
