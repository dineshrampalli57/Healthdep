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
.style3 {font-size: 18}
.style24 {
	color: #FF0000;
	font-weight: bold;
}
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
          <li class="active"><a href="A_Main.jsp">Cloud Server </a></li>
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
        <div class="article">
          <h2 class="style24">Select Patient Disease To View Chart !!!</h2>
          <p>&nbsp;</p>
          <p class="style24">Select particular patient disease to view chart sorted by patients age wise. </p>
          <div align="center">
          <p>
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
					ArrayList disease =new ArrayList();
				String query="Select distinct(disease) from files  "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
					String disea=rs.getString(1);
					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String disea1 = new String(Base64.decode(disea.getBytes()));
					
					disease.add(disea1);
				}	
			
					
					%>
          </p>
          <p>&nbsp; </p>
          <form id="form1" name="form1" method="post" action="A_Chart.jsp">
            <label>
            <div align="center">
              <p><span class="style24">Select Disease
                  <select name="disease">
                    <option>-Select-</option>
                    <%for(i=0;i<disease.size();i++){%>
                    <option><%=disease.get(i)%></option>
                    <%}%>
                    </select>
              </span>                  <br />
              </p>
              <p>&nbsp; </p>
            </div>
            </label>
          
            </div>
            <label>
            <div align="center">
              <input type="submit" name="Submit" value="Submit" />
            </div>
            </label>
          </form>
          <p></p>
		  <%String disease1=request.getParameter("disease");
		  if(!(disease1.equalsIgnoreCase("-Select-"))){%>
          <p>
            <iframe width="600" height="350" src="A_Disease_chart.jsp?disease=<%=disease1%>"></iframe>
          </p>
		  
		    <%}
				
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
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
