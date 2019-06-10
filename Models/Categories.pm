package Models::Categories;

use strict;
use warnings FATAL => 'all';

use Data::Dumper;

use Models::DB;

my $db;
my $model;
my $table = 'category';

sub new
{
    my($self, $dbModel, $dbh) = @_;
    $model = $dbModel;
    $db = $dbh;
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}

sub getCategory
{
    my ($self) = @_;

    $model->selectCategory($table);
   
    my $query = $model->execute();

    return $model->getDataHash($query);
}



1;
