<%@ include file="connect.jsp" %>
<%

try
{
String department=request.getParameter("department");
String dep="";

if(department.equalsIgnoreCase(""))
{
	dep="Enter Value To Add.. !!";
		application.setAttribute("dep",dep); 
}
else
{
	String query="select * from  department where department='"+department+"'";
	Statement st=connection.createStatement();
	ResultSet rs =st.executeQuery(query);
	if(rs.next())
	{
		dep="Department Already Present !!";
		application.setAttribute("dep",dep); 
	}
	else
	{
	
		String query1="insert into department(department) values('"+department+"') ";
		Statement st1=connection.createStatement();
		st1.executeUpdate(query1);
		
		dep="Department Added Sucessfully !!";
		application.setAttribute("dep",dep);
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
