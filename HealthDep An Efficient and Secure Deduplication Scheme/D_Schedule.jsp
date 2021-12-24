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
.style49 {font-size: 14px}
.style56 {color: #4b4b4b}
.style58 {
	font-size: 14px;
	color: #FFFF00;
	font-weight: bold;
}
.style59 {color: #4b4b4b; font-size: 14px; }
.style61 {color: #FF0000; font-size: 14px; }
.style63 {
	color: #FFFFFF;
	font-weight: bold;
}
.style64 {color: #FF0000}
.style66 {color: #FFFF00; font-weight: bold; }
.style67 {color: #FFFF00}
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
          <h2><span>Schedule Patients </span></h2>
          <p><span class="style37">Role : (Doctor)</span>
						
          </p>
          <p>&nbsp;</p>
          <table width="556" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
						String fname = request.getParameter("fname");

				String query="Select *from files where fname='"+fname+"'  "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				if ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(8);
					s5=rs.getString(9);
					s6=rs.getString(11);
					String keys = "ef50a0ef2c3e3a5f";
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.DECRYPT_MODE, key);
      			String s51 = new String(Base64.decode(s5.getBytes()));
				
				
	%>      </table>
	<form action="D_Schedule1.jsp" method="get">
          <table width="625" style="border-collapse:collapse" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="107" height="33" bgcolor="#FF0000"><span class="style49"><span class="style66">ID : </span></span></td>
              <td width="92"><div align="left" class="style61"><%=i%></div></td>
              <td width="138" bgcolor="#FF0000"><div align="left" class="style58">Status : </div></td>
			  <%if (s6.equalsIgnoreCase("No")){%>
              <td width="166" bgcolor="#FFFFFF"><div align="left" class="style37">
                <div align="center">Not Scheduled</div>
              </div></td>
			  <%}else{%><td width="122" bgcolor="#CCCCCC"><div align="left" class="style63"> 
			    <div align="center" class="style64"><%=s6%> </div>
			  </div></td>
			  <%}%>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><span class="style66">Hospital</span><span class="style67"> : </span></td>
              <td><div align="left" class="style61"><%=s51%></div></td>
              <td bgcolor="#FF0000"><div align="left" class="style58">Select Treatment Date  : </div></td>
              <td><div align="left" class="style59"><strong>
                <input  type="date"name="sch_dt" />
              </strong></div></td>
            </tr>
            <tr>
              <td height="33" bgcolor="#FF0000"><span class="style58">Details/File</span><span class="style67"> : </span></td>
              <td><div align="left" class="style61"><a href="D_Pat_Details.jsp?fname=<%=s2%>"><%=s2%></a></div></td>
              <td><div align="left"><span class="style56"><span class="style49"></span></span></div></td>
              <td width="166" bgcolor="#FFFFFF"><div align="left"><span class="style56"><span class="style49"></span></span><strong>
                <input type="time" name="sch_time" />
              </strong></div></td>
            </tr>
            <tr>
              <td height="32" bgcolor="#FF0000"><span class="style49"><span class="style66">Patient Name : </span></span></td>
              <td><div align="left" class="style61"><%=s3%></div></td>
			  
			  <%
			  if (!(s6.equalsIgnoreCase("Scheduled")))
			  {
			  	%>
              <td width="138" bgcolor="#000000"><span class="style56"></span>
                  <label>
                  <input type="hidden" name="hospital" value="<%=s5%>" />
                  <input type="hidden" name="id" value="<%=i%>" />
                  <input type="hidden" name="pname" value="<%=s3%>" />
				  <input type="hidden" name="fname" value="<%=s2%>" />
                  <div align="center" class="style56">
                    <input type="submit" name="Submit" value="Schedule Patient " />
                  </div>
                <span class="style56">
                  </label>
                </span></td>
			  	<%
			  }
			  
			  
			  %>
			  
			 
              <td width="166" bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
				<%	  
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          </table>
  		  </form>

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
