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
		
		String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
		  
			String pname=(String)application.getAttribute("pname");
			
			String id=request.getParameter("id");
			
			connection.createStatement().executeUpdate("update scheduled_patients set status='Accepted' where id='"+id+"'");
			
			
			String query="Select *from scheduled_patients where id='"+id+"' "; 
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
					s8=rs.getString(8);		
					s9=rs.getString(9);
			
					String schdt=s5+","+s6;
					
					Statement st2=connection.createStatement();
					String query12="insert into schedule_transaction (patient,doctor,fname,sch_dt,status)values('"+s2+"','"+s3+"','"+s8+"','"+schdt+"','Accepted Schedule')";
					st2.executeUpdate(query12);
						
				}
				
			response.sendRedirect("P_ViewDetails.jsp");
		
		%>
</body>
</html>
