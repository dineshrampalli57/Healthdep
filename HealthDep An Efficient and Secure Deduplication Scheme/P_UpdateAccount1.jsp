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

</head>
<body>

            <%		  
					String pname=(String)application.getAttribute("pname");
					String bank=request.getParameter("bank");
					String branch=request.getParameter("branch");
					String accno=request.getParameter("accno");
					String mobno=request.getParameter("mobno");
					int new_amt=Integer.parseInt(request.getParameter("new_amt"));
					String id=request.getParameter("id");
					
					String sql="select *from bank_account where id='"+id+"' ";
					ResultSet rs=connection.createStatement().executeQuery(sql);
					if(rs.next())
					{
						int amt=new_amt+Integer.parseInt(rs.getString(8));
						String up_amt=Integer.toString(amt);
						
						connection.createStatement().executeUpdate("update bank_account set total_amount='"+up_amt+"' where id='"+id+"'");
						response.sendRedirect("P_UpdateAccount.jsp");
					}
					else
					{		  
						%>Access Denaid !!<%		
					}
          %>
</body>
</html>
