#!/usr/bin/perl
use warnings;
use strict;
use LWP::UserAgent;
my $User_Agent = LWP::UserAgent->new;
package POSTReq;
sub new{
    my $class=shift;
    my $self={
        'Body' => shift,
        'URL' => shift
    };
    bless $self, $class;
    return $self;
}
#**********************POST Request Subroutine**************************
sub POST_Req(){ 
    my ($self) = @_;
    my $request = HTTP::Request->new(POST => $self->{'URL'});
    $request->header('content-type' => 'application/json');
    $request->content($self->{Body});
    my $response = $User_Agent->request($request);
    my @resp_code = split(" ",$response->code);
    if ($resp_code[0] == 200 ) {
        print "Http Status code: ",$response->code,"\n";
        print "Customer has been successfully Added.\n";
    }
    elsif($resp_code[0] == 500 ) {
        print "Http Status code: ",$response->code,"\n";
        print "An unexpected error occurred. Please contact your administrator.\n";
    }
    else{
        print $response->code," Some Error\n"
    }
    return $response->code;
}
1;

package DELETEReq; 
sub new{
    my $class=shift;
    my $self={
        'URL' => shift
    };
    bless $self, $class;
    return $self;
}

#*****************DELETE request subroutine********************
sub DELETE_Req(){
    my ($self) = @_;
    my $request = HTTP::Request->new(DELETE => $self->{'URL'});
    my $response = $User_Agent->request($request);
    my @resp_code = split(" ",$response->code);
    if ($resp_code[0] == 200 ) {
        print "Http Status code: ",$response->code,"\n";
        print "Customer has been successfully Added.\n";
    }
    elsif($resp_code[0] == 404 ) {
        print "Http Status code: ",$response->code,"\n";
        print "Customer does not exist.\n";
    }
    if ($resp_code[0] == 403 ) {
        print "Http Status code: ",$response->code,"\n";
        print "You do not have required privileges to delete a customer.\n";
    }
    elsif($resp_code[0] == 500 ) {
        print "Http Status code: ",$response->code,"\n";
        print "An unexpected error occurred. Please contact your administrator.\n";
    }
    else{
        print $response->code," Some Error\n"
    }
    return $response->code;
}
1;