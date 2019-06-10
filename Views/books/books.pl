$articles = '';

my $previous = '';
my $next = '';

if ($page > 1)
{
    my $prePage = $page - 1;
    $previous = '<a href="index.pl?route=default/books&page=' .$prePage. '" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                 </a>';
}

if ($page < $pages)
{
    my $nextPage = $page + 1;
    $next = '<a href="index.pl?route=default/books&page=' .$nextPage. '" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
             </a>';
}

$pagination =  '<div class="centrl">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>' .$previous. '</li>
                            <li><a href="index.pl?route=default/books&page=' .$page. '">' .$page. '</a></li>
                            <li>' .$next. '</li>
                        </ul>
                    </nav>
                </div>';

foreach $arg(@data)
{
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
                <div class="right-column"><a href ="index.cgi?route=default/bookid/$arg->{'id'}" role="button" class="btn btn-info">Show book</a></div>
            </div>
        </div>
HTML
};

$articles .= $pagination;
$content =<<HTML;
$articles
HTML

return 1;



