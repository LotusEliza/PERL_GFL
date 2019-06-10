$loyout = <<HTML;
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
   
    <title>Camel Team</title>
    
    <!-- Bootstrap core CSS -->
    <link href="webroot/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="webroot/css/style.css" />

  </head>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!--nav class="navbar  navbar-fixed-top" role="navigation"-->
      <div class="container">
        
        <div class="collapse navbar-collapse">
          
          <ul class="nav navbar-nav">
            <li><a href="index.cgi?route=default/books">Books</a></li>
          </ul>
          <ul class="nav navbar-nav">
            <li><a href="index.cgi?route=default/categories">Categories</a></li>
          </ul>          
        </div><!--/.nav-collapse -->
      </div><!--/.container -->
    </nav>
      
    
     <div class="container content">
           $content
     </div>

    <!--footer>
        Copyright &copy; 2017
    </footer-->
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="webroot/js/jquery.js"></script>
    <script src="webroot/js/script.js"></script>
    <script src="webroot/js/bootstrap.min.js"></script>
  </body>
</html>

HTML

return 1;
