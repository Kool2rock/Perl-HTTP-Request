#!/usr/bin/perl
use strict;
use warnings;
use perl1;
use Test::Simple tests => 5;
my $Body = '{“FirstName”: “Kumar””LastName”: “value”,”UserName”: “Kuldeep”,”Password”: “Password123”,”Email”: “Kuldeep\@kumar.com”}';
my $obj = new POSTReq($Body,"http://restapi.demoqa.com/customer/regist"); #wrong URL
ok ($obj->POST_Req() == 404, "URL Not Found");
my $objA = new POSTReq($Body,"http://restapi.demoqa.com/customer/register");
ok ($objA->POST_Req() == 200, "Success on 200");
ok ($objA->POST_Req() == 500, "Some Error");

my $obj1 = new DELETEReq("http://restapi.demoqa.com/customer/delete/1510"); #wrong URL
ok ($obj1->DELETE_Req() == 404, "Costomer does not exist!!");

my $obj2 = new DELETEReq("http://restapi.demoqa.com/customer/delete/15410");
ok ($obj2->DELETE_Req() == 403, "insufficient privileges!!");

my $obj3 = new DELETEReq("http://restapi.demoqa.com/customer/delete/15410"); #wrong URL
ok ($obj3->DELETE_Req() == 200, "Success on 200");

my $obj4 = new DELETEReq("http://restapi.demoqa.com/customer/delete/15410");
ok ($obj4->DELETE_Req() == 500, "some error");
