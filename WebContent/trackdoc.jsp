<%@ page import="javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.*" %>
<!DOCTYPE html>
<html>
   <head>
      <title>MinorProject-OfficeMgmt</title>
      <meta name='viewport' content='width=device-width, initial-scale=1.0'>
      <!-- Bootstrap -->
      <link href='css/bootstrap.min.css' rel='stylesheet'>
	  <!--my css-->
	  <link href='css/a.css' rel='stylesheet'>
	  	  <link href='css/test.css' rel='stylesheet'>
      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media 
         queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page 
         via file:// -->
      <!--[if lt IE 9]>
         <script src='https://oss.maxcdn.com/libs/html5shiv/3.7.0/
            html5shiv.js'></script>
         <script src='https://oss.maxcdn.com/libs/respond.js/1.3.0/
            respond.min.js'></script>
      <![endif]-->
	  <!--font awesome. for icons used in top of page-->
	  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	  
	  
	  
	  
	  
	  
	  


	  
	  
	  
	  
	</head>
	<body>
	
	<div class='container'>
	<div class="scroll-top-wrapper ">
    <span class="scroll-top-inner">
    <i class="fa fa-2x fa-arrow-circle-up"></i>
    </span>
	</div>
	
	<nav role='navigation' class='navbar navbar-inverse'>
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class='navbar-header'>
        <button type='button' data-target='#navbarCollapse' data-toggle='collapse' class='navbar-toggle'>
            <span class='sr-only'>Toggle navigation</span>
            <span class='icon-bar'></span>
            <span class='icon-bar'></span>
            <span class='icon-bar'></span>
        </button>
        <a href='index.html' class='navbar-brand'>MinorProject</a>
    </div>
    <!-- Collection of nav links and other content for toggling -->
    <div id='navbarCollapse' class='collapse navbar-collapse'>
        <ul class='nav navbar-nav'>
            <li><a href='#'>Admin </a></li>
            <li><a href='#'>Documents </a></li>
			<li><a href='#'>Visitors </a></li>
			</ul>
        <ul class='nav navbar-nav navbar-right'>
            <li><a href='jackie.html'>Login</a></li>
        </ul>
    </div>
</nav>
<div class='top'></div>
<div class='row'>
<div class='col-md-2'></div>
<div class='col-md-8'>
<div id='ada' class='jumbotron'>
	  <p>
	  trackHere
	  </p>
	  </div>
	  </div>
	  <div class='col-md-2'></div>
	  
	  
	    <table class='table table-hover table-bordered'>
        <thead>
            <tr>
                <th>DocId </th>
                <th>From</th>
                <th>In Dept</th>
				<th>Sent To</th>
				<th>Received On</th>
				<th>Sent On</th>
				<th>Completed On.</th>
            </tr>
        </thead>
        <tbody>
            
			

<%


String docid= request.getParameter("docid");
Control ctrl=new Control();
if(ctrl.con==null)
{
	application.setAttribute("message","Please Start Your Database Server");
	response.sendRedirect("message.jsp");
}
else if((docid==null)||docid.equals(""))
{
	response.sendRedirect("index.html");
}
else
{
	
		if(ctrl.idExists(Integer.parseInt(docid)))
		{
			//display the data of the docid
			//since id check has been done rs can never be null
			ResultSet rs=ctrl.selectStar(docid);
			try {
				while(rs.next())
				{
					%>
					<tr class='clickableRow' href=#>
					<%
					for(int i=1;i<=7;i++)
					{
						
						
					
%>

                <td>
				
				
				<%
				
				out.println(rs.getString(i));
				}
				%>
				</td>
				<%
				
					//out.println("\n");
					
				}
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				System.out.println("Serv4 "+e);
				
				application.setAttribute("message","there has been some error. Please try again.");
			}
			
			
			
		}
		else
		{
			
			application.setAttribute("message","no such docId exists");
			response.sendRedirect("message.jsp");
		}
}

				%>
            </tr>		
            
           
       		</tbody>
    </table>


<div class='below'></div>
<div class='row'>
<div class='col-md-12'>
<div class='myfooter'>
<nav role='navigation' class='navbar navbar-inverse'>
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class='navbar-header'>
       
        <a href='index.html' class='navbar-brand'>MinorProject-Home</a>
    </div>
      
        
    </div>
</nav>
</div>
</div>
</div>
	  
	  
	  
	  
	  
	  
	  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src='https://code.jquery.com/jquery.js'></script>
      <!-- Include all compiled plugins (below), or include individual files 
            as needed -->
      <script src='js/bootstrap.min.js'></script>
	  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 <script>
 
$(function(){
 
    $(document).on( 'scroll', function(){
 
        if ($(window).scrollTop() > 1) {
            $('.scroll-top-wrapper').addClass('show');
        } else {
            $('.scroll-top-wrapper').removeClass('show');
        }
    });
});
</script>
   <script>
 
$(function(){
 
    $(document).on( 'scroll', function(){
 
        if ($(window).scrollTop() > 1) {
            $('.scroll-top-wrapper').addClass('show');
        } else {
            $('.scroll-top-wrapper').removeClass('show');
        }
    });
 
    $('.scroll-top-wrapper').on('click', scrollToTop);
});
 
function scrollToTop() {
    verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;
    element = $('body');
    offset = element.offset();
    offsetTop = offset.top;
    $('html, body').animate({scrollTop: offsetTop}, 200, 'linear');
}
</script>

 
 </div> </body>
</html>