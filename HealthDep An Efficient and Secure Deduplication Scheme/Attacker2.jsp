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
<title>Attacker</title>
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
.style3 {font-size: 18}
.style29 {color: #FFFF00; font-weight: bold; }
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
          <li class="active"><a href="Attacker.jsp">Attacker !! </a></li>
          <li><a href="index.html">Logout</a></li>
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
          <h2><span>Attack Patient Details </span> Status </h2>
          <p><span class="style2">(Attacker)</span></p>
          <p>&nbsp;</p>
          <%
		  String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
	try
	{
		  
		  String fname=request.getParameter("fname");
		  
		  String sql="select * from files where fname='"+fname+"' ";
		  Statement st=connection.createStatement();
		  ResultSet rs=st.executeQuery(sql);
		  if(rs.next())
		  {
		    i=rs.getInt(1);
		  	s1=rs.getString(2);
		  	s2=rs.getString(3);
		  	s3=rs.getString(12);
		  	s4=rs.getString(8);
			
			String keys = "ef50a0ef2c3e3a5f";
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.DECRYPT_MODE, key);
      			String decryptedValue = new String(Base64.decode(s2.getBytes()));
				%>
				
				<form id="form1" name="form1" method="post" action="Attacker3.jsp">
            <table width="540" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="108" height="35" bgcolor="#FF0000"><span class="style29">Patient Name : </span></td>
                <td width="369"><input type="text" readonly="readonly" name="pname" value="<%=s4%>" /></td>
              </tr>
              <tr>
                <td height="36" bgcolor="#FF0000"><span class="style29">Details / File Name  : </span></td>
                <td><input type="text" readonly="readonly" name="fname" value="<%=s1%>" /></td>
              </tr>
              <tr>
                <td height="36" bgcolor="#FF0000"><span class="style29">Disease : </span></td>
                <td><input type="text" readonly="readonly" name="disease" value="<%=s3%>" /></td>
              </tr>
              <tr>
                <td height="176" bgcolor="#FF0000"><span class="style29">Details : </span></td>
                <td><textarea name="textarea" cols="45" rows="10"><%=decryptedValue%></textarea></td>
              </tr>
              <tr>
                <td height="29" bgcolor="#FF0000">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="42" bgcolor="#FF0000"><span class="style29">Upload : </span></td>
                <td>
                  <label>
                    <input type="submit" name="Submit" value="Change Content" />
                  </label>                </td>
              </tr>
            </table>  
          </form>
            <%
			
		  }
		  connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
		  %>
        
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
