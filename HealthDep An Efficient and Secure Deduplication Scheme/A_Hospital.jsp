<%@ include file="connect.jsp" %>
<%

try
{
String hospital=request.getParameter("hospital");
String hosp="";
if(hospital.equalsIgnoreCase(""))
{
	hosp="Enter Value To Add.. !!";
		application.setAttribute("hosp",hosp); 
}
else
{
	String query="select * from  hospital where hospital='"+hospital+"'";
	Statement st=connection.createStatement();
	ResultSet rs =st.executeQuery(query);
	if(rs.next())
	{
		hosp="Hospital Already Present !!";
		application.setAttribute("hosp",hosp); 
	}
	else
	{
	
		String query1="insert into hospital(hospital) values('"+hospital+"') ";
		Statement st1=connection.createStatement();
		st1.executeUpdate(query1);
		
		hosp="Hospital Added Sucessfully !!";
		application.setAttribute("hosp",hosp);
	}
	
	connection.close();
	
}	
	response.sendRedirect("A_AddHospital.jsp");

}
catch(Exception e)
{
out.println(e);
}

%>
