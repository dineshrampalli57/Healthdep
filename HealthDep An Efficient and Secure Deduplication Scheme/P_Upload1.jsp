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
.style21 {color: #515455;
	font-weight: bold;
}
.style24 {color: #6D9EAD}
.style25 {font-size: 16px}
.style27 {color: #FF0000; font-weight: bold; font-size: 16px; }
.style28 {color: #FFFFFF}
.style29 {color: #FFFFFF; font-weight: bold; }
.style30 {color: #FF0000}
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
          <h2 class="style30">Upload Patient Details !!!</h2>
          <p><span class="style2">Role : (Patient)</span></p>
          <form action="P_Upload2.jsp" method="post">
            <h3>
              <%
      	try {
			String filename=request.getParameter("t42");
      		String file=request.getParameter("tt");
      		String cont=request.getParameter("text");
      		String hospital=request.getParameter("hospital");
			
      		String disease=request.getParameter("disease");
      		String age=request.getParameter("age");
      		String bloodgroup=request.getParameter("bloodgroup");
      		String gender=request.getParameter("gender");
      		String email=request.getParameter("email");
      		String mob=request.getParameter("mob");
			
			String pname=(String)application.getAttribute("pname");
			
			
			
			
			application.setAttribute("file1",file);


				String keys = "ef50a0ef2c3e3a5f";
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));
				
      			String disease1 = new String(Base64.encode(disease.getBytes()));
      			String bloodgroup1 = new String(Base64.encode(bloodgroup.getBytes()));
      			String email1 = new String(Base64.encode(email.getBytes()));
      			String hospital1 = new String(Base64.encode(hospital.getBytes()));
				
				
				
				
				
				

			String namefile=request.getRealPath("file");
      		PrintStream p = new PrintStream(new FileOutputStream(namefile+"/"));
			p.print(new String(cont));
      		String h1="";
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(namefile+"/");
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
			if(hospital.equalsIgnoreCase("-Select-"))
			{
				%><br/>
              <span class="style25">Please <span class="style24">Select Hospital</span> To Continue.. !!              </span>
              <%
			}
			else
			{
			
%>
            </h3>
            <p>&nbsp;</p>
            <table width="580" border="0" align="center" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style28"><strong>Patient Name : </strong></span></td>
                <td><input name="pname" type="text" id="t42" size="49" value="<%= pname %>" readonly="readonly" /></td>
              </tr>
              <tr>
                <td width="176" height="34" bgcolor="#FF0000"><span class="style21 style28"><strong>File Name : </strong></span></td>
                <td width="405"><input name="t42" type="text" id="t42" size="49" value="<%= file %>" readonly="readonly" /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style28"><strong> Disease : </strong></span></td>
                <td><input name="disease" type="text"  size="49" value="<%= disease1 %>"  /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style28"><strong> Age : </strong></span></td>
                <td><input name="age" type="text"  size="49" value="<%= age %>"  /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style28"><strong>Blood Group : </strong></span></td>
                <td><input name="bloodgroup" type="text"  size="49"  value="<%= bloodgroup1 %>"  /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style28"><strong>Gender : </strong></span></td>
                <td><input name="gender" type="text"  size="49"   value="<%=gender%>"></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style28"><strong>E-mail : </strong></span></td>
                <td><input name="email" type="text"  size="49"   value="<%=email1%>" /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style28"><strong>Mobile No  : </strong></span></td>
                <td><input name="mob" type="text"  size="49"   value="<%=mob%>" /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style28"><strong>Hospital : </strong></span></td>
                <td><input name="hospital" type="text" id="t42" size="49" value="<%= hospital1 %>" readonly="readonly" /></td>
              </tr>

              <%
				ArrayList doc=new ArrayList();
				String query1="select name from  doctor where d_hospital='"+hospital+"'";
				Statement st1=connection.createStatement();
				ResultSet rs1 =st1.executeQuery(query1);
				while(rs1.next())
				{
					String nam=rs1.getString(1);
					doc.add(nam);
				}
				
				%>
              <tr>
                <td height="42" bgcolor="#FF0000" ><span class="style29">Select Doctor :- </span></td>
                <td>
				<select id="select" name="doctor" class="text">
                  <option>-Select-</option>
                  <%for(int i=0;i<doc.size();i++){%>
                  <option><%=doc.get(i)%></option>
                  <%}%>
                </select> 
				&nbsp;&nbsp;&nbsp; <span class="style27"><-----------</span></td>
              </tr>
              <tr>
                <td height="256" bgcolor="#FF0000"><span class="style28"><strong><%=file%> Data(Encrypted) : </strong></span></td>
                <td><textarea name="text2" id="textarea" cols="50"  rows="15" readonly="readonly"><%= encryptedValue %></textarea></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style28 style21"><strong>Trapdoor : </strong></span></td>
                <td><input name="t4223" type="text" id="t4223" size="49" value="<%= h1 %>" readonly="readonly" /></td>
              </tr>
              <tr>
                <td height="34"><div align="right"> </div></td>
                <td><input  type="submit" name="Submit2" value="Upload" /></td>
              </tr>
            </table>
            <p>
              <%}

	   

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
            </p>
          </form>
          <p align="right"><a href="P_Upload.jsp">Back</a></p>
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
