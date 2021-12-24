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
.style2 {	color: #FF0000;
	font-weight: bold;
}
.style19 {
	font-size: 14px;
	font-weight: bold;
	color: #CC3300;
}
.style20 {font-size: 14px}
.style23 {color: #FFFF00; font-weight: bold; }
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
          <h2 class="style2">View Account !!!</h2>
          <p><span class="style2">Role : (Patient)</span></p>
		  <p>
		    <%
		  try
		  {
		  	String pname=(String)application.getAttribute("pname");
			int found=0;
			  String sql="select *from bank_account where pname='"+pname+"'";
			  ResultSet rs=connection.createStatement().executeQuery(sql);
			  while(rs.next())
			  {
			  		int i =rs.getInt(1);
			  		String name=rs.getString(2);
			  		String bank=rs.getString(3);
			  		String branch=rs.getString(4);
			  		String accno=rs.getString(5);
			  		String mobno=rs.getString(6);
			  		String email=rs.getString(7);
			  		String tot_bal=rs.getString(8);
					found=found+1;
		  
		  %>
	      </p>
		  <p class="style19">Account : <%=found%></p>
		  <table width="441" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="25" bgcolor="#FF0000"><span class="style23">Bank : </span></td>
              <td><input type="text" name="bank" disabled="disabled" value="<%=bank%>" /></td>
            </tr>
            <tr>
              <td height="25" bgcolor="#FF0000"><span class="style23">Branch : </span></td>
              <td><input type="text" name="branch" disabled="disabled"  value="<%=branch%>"/></td>
            </tr>
            <tr>
              <td width="145" height="25" bgcolor="#FF0000"><span class="style23">Account No : </span></td>
              <td width="290"><input type="text" name="accno"   disabled="disabled" value="<%=accno%>"/></td>
            </tr>
            <tr>
              <td height="25" bgcolor="#FF0000"><span class="style23">Mobile No : </span></td>
              <td><input type="text" name="mobno" disabled="disabled" value="<%=mobno%>"/></td>
            </tr>


            <tr>
              <td height="25" bgcolor="#FF0000"><span class="style23">E-mail : </span></td>
              <td><input type="text" name="email" disabled="disabled" value="<%=email%>"/></td>
            </tr>

            <tr>
              <td height="25" bgcolor="#FF0000"><span class="style23">Available Balance : </span></td>
              <td><input type="text" name="amount" disabled="disabled" value="<%=tot_bal%>"/></td>
            </tr>
          </table>
		  <p>&nbsp;</p>
		  <h3>
		    <%
				}
				if(found==0)
				{
					%>
		    <span class="style20">There Are No Accounts In Your Name To Show .. !</span>
		    <%
				}
			}
			catch(Exception e)
			{
				out.print(e);
			}
				
			
			%>
	      </h3>
		  <p align="right"><a href="P_BankAcc.jsp">Back</a></p>
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
