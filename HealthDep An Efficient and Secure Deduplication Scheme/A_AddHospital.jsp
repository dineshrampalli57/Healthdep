<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
.style2 {color: #4b4b4b}
.style3 {color: #FF0000}
.style4 {font-weight: bold}
.style5 {color: #FF0000; font-weight: bold; }
.style6 {font-size: 18}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><span class="style6"><a href="index.html" class="style1">HealthDep An Efficient and Secure Deduplication Scheme for Cloud-Assisted eHealth Systems</a></span></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="A_Main.jsp">Cloud Server</a></li>
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
        <div >
          <h2><span>Add Hospital &amp; Department </span></h2>
          <p>&nbsp;</p>
          <p class="style2"><a href="A_ViewAddedHospital.jsp">Click Here</a> <span class="style5">To View Hospitals &amp; Departments Added </span></p>
          <p>&nbsp;</p>
          <form id="form1" name="form1" method="post" action="A_Hospital.jsp">
            <label>
              <span class="style5">Enter Hospital Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <input type="text" name="hospital" />
            </span></label>
            <span class="style5">
			 <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="submit" name="Submit" value="Submit" />
             <br />
             <br />
             <br />
             </label>
			 <%String hosp=(String)application.getAttribute("hosp");
			  if(hosp!=(null))
			  {%>
            </span>
            <p align="center" class="style3"><strong><%=hosp%></strong></p>
            <span class="style5">
            <%application.removeAttribute("hosp");
			  }%>
            </span>
          </form>
          <p class="style5">&nbsp;</p>
          <form id="form1" name="form1" method="post" action="A_Department.jsp">
            <span class="style5">
            <label> Enter Department Name :&nbsp;</label>
            </span><span class="style3"><label></label>
            </span>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="text" name="department" />
            </label>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="Submit2" value="Submit" />
            </label>
            <p>&nbsp;</p>
            <p>
			  <%String dep=(String)application.getAttribute("dep");
			  if(dep!=(null))
			  {%>
		    </p>
			<p align="center" class="style4"><strong> <%=dep%></strong></p>
            <%application.removeAttribute("dep");
			  }%>
          </form>
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
