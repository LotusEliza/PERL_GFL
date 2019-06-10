package Models::Books;

use strict;
use warnings FATAL => 'all';

use Data::Dumper;

use Models::DB;

my $db;
my $model;
my $table = 'books';

sub new
{
    my($self, $dbModel, $dbh) = @_;
    $model = $dbModel;
    $db = $dbh;
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}

sub getAmount
{
    my ($self, $start, $count) = @_;

    $model->select($table);
   
    $model->limit($start, $count);
    my $query = $model->execute();

    return $model->getDataHash($query);
}



1;
