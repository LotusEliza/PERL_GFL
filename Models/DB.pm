package Models::DB;
use strict;
use warnings FATAL => 'all';

use Data::Dumper;
use DBI;

my $dbh;
my $self;
my $sql;

sub instance;
sub connect;
sub rowsCount;
sub select;
sub selectCategory;
sub limit;
sub execute;
sub getDataHash;
sub checkConnect;
sub validString;

sub instance
{
    my ($class, $args) = @_;

    $self = $args;

    bless $self, $class;
    return $self;
}

sub connect
{
    my ($self) = @_;
    $dbh = DBI->connect("DBI:$self->{'dbType'}:$self->{'dbName'}:$self->{'dbHost'}",$self->{'dbUser'}, $self->{'dbPassword'});
    if ($dbh)
    {
        return $dbh;
    }
}

sub rowsCount
{
    my ($self, $table) = @_;
    $self->checkConnect();

    my $sel_sql = "SELECT * FROM $table ";
    my $cnt = $dbh->do($sel_sql);

    return $cnt;
}

sub select
{
    my ($self, $table, $params) = @_;
    $self->checkConnect();

    my $param;
    if ($params)
    {
        $param = join(',', @$params);
    }
    else
    {
        $param = '*';
    }

    $sql .= "SELECT $param FROM $table ";
}

sub limit
{
    my ($self, $num, $offset) = @_;
    $sql .= " LIMIT $num". ($offset ? ", ".$offset : '');
}

sub selectCategory
{
    my ($self, $table, $params) = @_;
    $self->checkConnect();

    my $param;
    if ($params)
    {
        $param = join(',', @$params);
    }
    else
    {
        $param = '*';
    }

    $sql .= "SELECT $param FROM $table ";
}

sub execute
{
    my($self) = @_;

    my $query = $dbh->prepare($sql);

    if ($query->execute())
    {
        return $query;
    }
    return 0;
}

sub getDataHash
{
    my($self, $query) = @_;

    my @data = (); 
    while(my $row = $query->fetchrow_hashref())
    {
        push @data, $row; 
    }
 
    return @data;
}

sub checkConnect
{
    my($self) = @_;
    if (!$dbh)
    {
        $dbh = $self->connect();
    }
}

sub DESTROY
{
    if (defined($dbh))
    {
        $dbh->disconnect;
    }
}


1;
