<%@ include file="connect.jsp" %>
<%

try
{
	String id=request.getParameter("id");
	
	Statement st=connection.createStatement();
	String query1="update patient set status='Authorized' where id='"+id+"'";
	st.executeUpdate(query1);
	
	connection.close();
	
	response.sendRedirect("A_PatAutho.jsp");
}
catch(Exception e)
{
out.println(e);
}

%>
