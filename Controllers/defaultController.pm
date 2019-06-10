package Controllers::defaultController;

use strict;
use warnings;

use vars qw($content @data $idd);

use vars qw(@ISA);
use Controller;

@ISA = qw(Controllers::Controller);


use Models::Books;
use Models::Categories;
use Models::Pagination;
use Libs::Request;

sub authorsAction;
sub booksAction;
sub categoriesAction;

sub authorsAction
{
    my ($self) = @_;
    require 'authors/camel_team.pl';
    return $content; 
}

sub booksAction
{
    my ($self) = @_;

    my $limit = 3;
    my $start;

    my $pag = Models::Pagination->new($self->get('model'), $self->get('db'), $limit);
    our $pages = $pag->getCountPage('books');

    my $request = Libs::Request->new();
    our $page = $request->getData('page');

    if( !($page) or ($page > $pages) )
    {
        $page = 1;
        $start = 0;
    }
    else
    {
        $start = $limit * ($page - 1);
    }

    @data = $pag->getArticlePage($start, $limit);

    require 'books/books.pl';
    return $content; 

}

sub bookidAction
{
    my ($self, $id_) = @_;
    $idd = $id_;
    my $limit = 5;
    my $start;

    my $pag = Models::Pagination->new($self->get('model'), $self->get('db'), $limit);
    our $pages = $pag->getCountPage('articles');

    my $request = Libs::Request->new();
    our $page = $request->getData('page');

    if( !($page) or ($page > $pages) )
    {
        $page = 1;
        $start = 0;
    }
    else
    {
        $start = $limit * ($page - 1);
    }

    @data = $pag->getArticlePage($start, $limit);

    require 'bookid/bookid.pl';
    return $content; 

}

sub categoriesAction
{
    my ($self) = @_;

    my $pag = Models::Categories->new($self->get('model'), $self->get('db'));
    
    my $request = Libs::Request->new();
    our $page = $request->getData('page');

    @data = $pag->getCategory('category');

    require 'categories/categories.pl';
    return $content; 

}

1;
