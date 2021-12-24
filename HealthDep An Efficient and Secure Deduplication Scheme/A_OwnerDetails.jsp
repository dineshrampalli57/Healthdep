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
<title>Cloud</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 23px}
.style25 {color: #3f3f3f;
	font-weight: bold;
}
.style35 {color: #515455; font-weight: bold; }
.style37 {color: #FF0000; font-weight: bold; }
.style38 {color: #FF0000}
.style40 {color: #FFFF00}
.style42 {color: #000000; }
.style3 {font-size: 18}
.style43 {color: #FFFF00; font-weight: bold; }
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
        <div>
          <h2 class="style37"> Doctor Details !!! </h2>
         
            <p>
              <%
						String doname = request.getParameter("name");
						//int uid = Integer.parseInt(mid);
						String s1,s2,s3,s4,s5,s6="",s7="",s8,s9,s10,s11,s12,s13;
						int i=0;
						try 
						{
						   	String query="select * from doctor where name='"+doname+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		if ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(5);
								s4=rs.getString(6);
								s5=rs.getString(7);
								s6=rs.getString(13);
								s7=rs.getString(14);
								//s8=rs.getString(8);
								
								
								
								
								
					%>
            </p>
            <p>&nbsp;</p>
            <table width="378" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <th width="149" scope="col"><div align="left " class="style38 style35" style="margin-left:50px;">
                    <div align="right"><strong>Hospital :</strong></div>
                </div></th>
                <th width="196" scope="col"><div align="left" class="style37" style="margin-left:20px;">
                    <%out.println(s6);%>
                </div></th>
              </tr>
              <tr>
                <th scope="row"><div align="left " class="style37" style="margin-left:50px;">
                    <div align="right">Department :</div>
                </div></th>
                <td><div align="left" class="style37" style="margin-left:20px;">
                    <%out.println(s7);%>
                </div></td>
              </tr>
            </table>
            <table width="465" height="242" border="1" align="center"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse;  margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
            <tr>
              <td rowspan="8" ><div style="margin:10px 13px 10px 13px;" >
                  <div align="center">
                    <input  name="image" type="image" src="ownprofileimage.jsp?imgid=<%=i%>" style="width:150px; height:150px;" />
                  </div>
              </div></td>
            </tr>
            <tr>
              <td  width="150" height="40" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left" class="style25 style40" style="margin-left:20px;">Name:</div></td>
              <td  width="300" valign="middle" height="40" style="color:#000000;"><div align="left" class="style42" style="margin-left:20px;">
                  <%out.println(s1);%>
              </div></td>
            </tr>
            <tr>
              <td  width="120" height="40" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left" class="style43" style="margin-left:20px;">E-Mail:</div></td>
              <td  width="72" valign="middle" height="40" style="color:#000000;"><div align="left" class="style42" style="margin-left:20px;">
                  <%out.println(s2);%>
              </div></td>
            </tr>
            <tr>
              <td  width="100" height="40" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left" class="style43" style="margin-left:20px;">Mobile:</div></td>
              <td  width="82" valign="middle" height="40"><div align="left" class="style42" style="margin-left:20px;">
                  <%out.println(s3);%>
              </div></td>
            </tr>
            <tr>
              <td  width="100" height="40" align="left" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left" class="style43" style="margin-left:20px;">Date Of Birth:</div></td>
              <td  width="82" align="left" valign="middle" height="40"><div align="left" class="style42" style="margin-left:20px;">
                  <%out.println(s5);%>
              </div></td>
            </tr>
            <tr>
              <td  width="100" height="40" align="left" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left " class="style43" style="margin-left:20px;">Address:</div></td>
              <td  width="82" align="left" valign="middle" height="40"><div align="left" class="style42" style="margin-left:20px;">
                  <%out.println(s4);%>
              </div></td>
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
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
