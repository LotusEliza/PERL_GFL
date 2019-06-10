$categories = '';


foreach $arg(@data)
{
    $categories.= <<HTML;
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">$arg->{'name_category'}</h3>
            </div>
           
        </div>
HTML
};


$content =<<HTML;
$categories
HTML

return 1;



