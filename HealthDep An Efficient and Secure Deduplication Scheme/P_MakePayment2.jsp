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
.style25 {font-size: 16px}
.style26 {color: #999999}
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
        <div>
          <h2 class="style2">View Scheduled Date and Time !!!</h2>
          <p><span class="style2">Role : (Patient)</span></p>
          
              <p>
                <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
						
		String bill_id=request.getParameter("bill_id");
		String selected_bank=request.getParameter("bank");
		String pname=(String)application.getAttribute("pname");
		
		
		
		if(selected_bank.equalsIgnoreCase("-Select-"))
		{
			%>
                  <span class="style25">Please Select Bank To Continue..              </span>
                  <%
		}
		else
		{
			
		String query="Select *from bill where id='"+bill_id+"' "; 
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
		
		
		
		String query1="Select *from bank_account where pname='"+pname+"' and bank='"+selected_bank+"'"; 
		Statement st1=connection.createStatement();
		ResultSet rs1=st1.executeQuery(query1);
		if ( rs1.next() )
		{	
			k=rs1.getInt(1);
			String bank=rs1.getString(3);
			String branch=rs1.getString(4);
			String accno=rs1.getString(5);
			String amt=rs1.getString(8);
			
			%>
              </p>
              <p>&nbsp;</p>
			  <form id="form1" name="form1" method="post" action="P_MakePayment3.jsp">
          <table width="421" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="145" height="30"><span class="style2">Bank :</span></td>
    <td width="270"><input name="bank" type="text" value="<%=bank%>" readonly="readonly" /></td>
  </tr>
			<input type="hidden" name="bill_id" value="<%=bill_id%>" />
  <tr>
    <td height="29"><span class="style2">Branch :</span></td>
    <td><input name="branch" type="text" value="<%=branch%>" readonly="readonly" /></td>
  </tr>
  <tr>
    <td height="34"><span class="style2">Acc No:</span></td>
    <td><input name="accno" type="text" value="<%=accno%>" readonly="readonly" /></td>
  </tr>
    <%int avam =Integer.parseInt(amt);
  	int paam=Integer.parseInt(s6);
	 if(avam<paam){%>
	 <tr>
    <td height="31"><span class="style2">Available Balance :</span></td>
    <td> <span class="style2">Insufficient Funds !! </span></td>
  </tr>
	 <%}else{%>
  <tr>
    <td height="31"><span class="style2">Available Balance :</span></td>
    <td><input name="av_amt" type="text" value="<%=amt%>" readonly="readonly" /></td>
  </tr>
  <tr>
    <td height="30"><span class="style2">Amount to pay :</span></td>
    <td><input name="bill" type="text" value="<%=s6%>" readonly="readonly" /></td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td><span class="style26"></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
      <label>
        <input type="submit" name="Submit" value="Confirm &amp; Pay" />
        </label>    </td>
  </tr>
  <%}%>
</table>
    </form>

<%
		}	
		}
				
		  }
			connection.close();
		}
		catch(Exception e)
		{
		out.println(e.getMessage());
		}
		
		%>
            
          <p align="right"><a href="P_MakePayment.jsp">Back</a></p>
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
