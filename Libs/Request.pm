package Libs::Request;

use strict;
use warnings;
use vars qw(%in);
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);

$|=1;
ReadParse();

sub isPost;
sub getData;

sub new{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}

sub getData{
   my ($self, $key) = @_;
   return (exists %in->{$key}) ? %in->{$key} : undef;
}


1;
