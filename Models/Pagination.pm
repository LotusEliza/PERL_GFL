package Models::Pagination;

use strict;
use warnings FATAL => 'all';

use Data::Dumper;

use Models::DB;

use Models::Books;

my $db;
my $model;
my $table = 'books';
my $limit;


sub new
{
    my($self, $dbModel, $dbh, $lim) = @_;

    $model = $dbModel;
    $db = $dbh;
    $limit = $lim;
    my $class = ref($_[0])||$_[0];

    return bless {}, $class;
}

sub getArticlePage
{
    my ($self, $start, $count) = @_;

    my @arr = ();
    my $art = Models::Books->new($model, $db);
    @arr = $art->getAmount($start, $count);

    return @arr;
}


sub getCountPage
{
    my ($self, $table) = @_;

    my $cnt = $model->rowsCount($table);
    my $cntPage = int( ($cnt+1) / $limit);

    return $cntPage;
}

1;
