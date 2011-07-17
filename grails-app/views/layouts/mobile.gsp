<!doctype html>
<html>
	<head>
		<title><g:layoutTitle default="Grails"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0b1/jquery.mobile-1.0b1.min.css" />
<script src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.0b1/jquery.mobile-1.0b1.min.js"></script>
 <script>
 $(document).ready(function () { 
	    $('div').live('pagehide', function (event, ui) { 
	        var $this = $(this); 
	        if ($this.attr('ID') !== undefined && $this.attr('data-cache') !== undefined && $this.attr('data-cache') == "never") { 
	            var page = $this.attr('ID'); 
	            $(document.getElementById(page)).remove(); 
	        } 
	    }); 
	}); 
 </script>
		<g:layoutHead/>
	</head>
	<body>
		<div data-role="page" data-cache="never" id="mainpage">
			<g:layoutBody/>
		</div>
	</body>
</html>