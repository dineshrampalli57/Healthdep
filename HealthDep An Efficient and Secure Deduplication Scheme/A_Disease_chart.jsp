<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp"%>
<html>
<head>
<title>Transaction Results</title>
<script type="text/javascript" src="sources/jscharts.js"></script>
</head>
<body>
<div id="graph">Loading graph...</div>
<script type="text/javascript">
var myData=new Array();
var colors=[];

		<%
		try
		{
			int i=0,age=0;
			String s1=null;
			
			String disease=request.getParameter("disease");
			String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.ENCRYPT_MODE, key);
					String disease1 = new String(Base64.encode(disease.getBytes()));
			ResultSet rs=connection.createStatement().executeQuery("select max(age) from files where disease='"+disease1+"'  ");
			if(rs.next())
			{
			
				age=Integer.parseInt(rs.getString(1));
			}	
			int range1=1,range2=10;
			int p1=age%10;
			int p2=10-p1;
			int age1=age+p2;
			while(range2<=age1)
			{
				int count=0;
				ResultSet rs1=connection.createStatement().executeQuery("select count(*) from files where disease='"+disease1+"' and (age >'"+range1+"' and age<='"+range2+"') ");
				if(rs1.next())
				{
					count=rs1.getInt(1);
				}
				
				if(count>0)
				{
				String range=range1+"-"+range2;
				%>
				myData["<%=i%>"]=["<%=range%>",<%= count%>];
				
				<%
				
				i++;}
				range1=range2;
				range2=range1+10;
			
			}
		
		%>
	
	var myChart = new JSChart('graph', 'bar');
	myChart.setDataArray(myData);
	myChart.setBarColor('#42aBdB');
	myChart.setBarOpacity(0.8);
	myChart.setBarBorderColor('#D9EDF7');
	myChart.setBarValues(true);
	myChart.setTitleColor('#8C8383');
	myChart.setAxisColor('#777E89');
	myChart.setAxisValuesColor('#777E81');
	myChart.draw();
	
</script>

</body>
</html>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>

