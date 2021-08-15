#!/usr/bin/perl
use strict;
use warnings;
use perl1;
use Data::Dumper;
my $Body = '{“FirstName”: “Kumar””LastName”: “value”,”UserName”: “Kuldeep”,”Password”: “Password123”,”Email”: “Kuldeep@kumar.com”}';
my $obj = new POSTReq($Body,"http://restapi.demoqa.com/customer/register");
my $obj1 = new DELETEReq("http:// restapi.demoqa.com/customer/delete/15410");
$obj->POST_Req;
$obj1->DELETE_Req; 


