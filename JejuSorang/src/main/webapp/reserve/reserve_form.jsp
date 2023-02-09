<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Dialog - Default functionality</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <!-- <script>
  $( function() {
    $("#dialog").dialog({
    	   autoOpen : false        
           , width : 1200            
           , height : 800        
           , modal : true            
           , resizeable : false    
    }).dialog("open");
  } );
  </script> -->
</head>
<body>

<div id="dialog" title="Basic dialog">
  <jsp:include page="reserve_main_form.jsp"></jsp:include>
</div>
 
 
</body>
</html>