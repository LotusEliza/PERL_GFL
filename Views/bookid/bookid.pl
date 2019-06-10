$articles = '';

foreach $arg(@data)
{  if ($arg->{'id'}==$idd){
    $articles.= <<HTML;
            <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">$arg->{'title'}</h3>
            </div>
            <div class="panel-body">
                <div class="left-column"><img src="webroot/img/files/$arg->{'image'}"></div>
                <div class="left-column">
                <h3 class="display-4">$arg->{'author'}</h3><br>$arg->{'content'}</div>
            </div>
            <div class="panel-body">
                <div class="left-column">Price: $arg->{'price'} \$</div>
            </div>
        </div>
        
HTML
}
};
$arg=@data['$idd'];
$content.=<<HTML;
$articles
HTML

return 1;



