<!DOCTYPE html>
<html>
   <head>
      <title>Message</title>
      <meta name='viewport' content='width=device-width, initial-scale=1.0'>
      <!-- Bootstrap -->
      <link href='css/bootstrap.min.css' rel='stylesheet'>
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
   
   
   

<div class='one'>
<div class='row'>


<div class='col-sm-3'></div>
	  <div class='col-sm-6'>
	  <div class='message'>
	  <p>
	  <%
	  if(application.getAttribute("message")==null||application.getAttribute("message")==" ")
	  {
		  response.sendRedirect("index.html");
	  }
	  else{
	 out.println(application.getAttribute("message"));
	  application.setAttribute("message"," ");
	  }
	  %>
	  </p>
	  </div>
	  
	  </div>

	  <div class='col-sm-3'></div>

</div>

</div>
<br>
<div class='myfooter'>
<nav role='navigation' class='navbar navbar-inverse'>
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class='navbar-header'>
        
        <a href='index.html' class='navbar-brand'>MinorProject-Home</a>
    </div>

      
        
    </div>
</nav></div>


	  
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
    $('html, body').animate({scrollTop: offsetTop}, 250, 'linear');
}
</script>

</div>
</body>
</html>