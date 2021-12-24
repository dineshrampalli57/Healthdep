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
.style21 {color: #FFFF00; font-weight: bold; }
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
          <h2><span>Add Account </span></h2>
          <p><span class="style2">Role : (Patient)</span></p>
		  <form id="form1" name="form1" method="post" action="P_AddAccount1.jsp">
          <table width="441" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="32" bgcolor="#FF0000"><span class="style21">Bank : </span></td>
              <td><input type="text" name="bank" /></td>
            </tr>
            <tr>
              <td height="33" bgcolor="#FF0000"><span class="style21">Branch : </span></td>
              <td><input type="text" name="branch" /></td>
            </tr>
            <tr>
              <td width="145" height="31" bgcolor="#FF0000"><span class="style21">Account No : </span></td>
              <td width="290"><input type="text" name="accno" /></td>
            </tr>
            <tr>
              <td height="33" bgcolor="#FF0000"><span class="style21">Mobile No : </span></td>
              <td><input type="text" name="mobno" /></td>
            </tr>


            <tr>
              <td height="35" bgcolor="#FF0000"><span class="style21">E-mail : </span></td>
              <td><input type="text" name="email" /></td>
            </tr>

            <tr>
              <td height="32" bgcolor="#FF0000"><span class="style21">Amount : </span></td>
              <td><input type="text" name="amount" /></td>
            </tr>
			
			<tr>
              <td height="77"></td>
              <td>
                  <label>
                    <input type="submit" name="Submit" value="Add " />
                  </label>              </td>
            </tr>
          </table>
          </form>
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
