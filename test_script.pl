#! /usr/bin/perl

use strict;
use warnings;
use Selenium::Remote::Driver;
use Env;
use JSON;
use Test::More tests => 1;

my $job_id;
my $test_result;
my $username = $ENV{'SAUCE_USERNAME'};
my $access_key = $ENV{'SAUCE_ACCESS_KEY'};
my $browser_name = $ENV{'browserName'};
my $platform = $ENV{'platform'};
my $version = $ENV{'version'};

my $host = "$username:$access_key\@ondemand.saucelabs.com";

my $driver = new Selenium::Remote::Driver(
                          'remote_server_addr' => $host,
                          'port' => "80",
                          'browser_name' => $browser_name,
                          'version' => $version,
                          'platform' => $platform,
                          'extra_capabilities' => {'name' => 'Example Perl Test - Google'},
                          );

#Test
$driver->get('http://www.google.com');
ok "Google" eq $driver->get_title(); 
$job_id = $driver->session_id;
$driver->quit();

#Returns the number of tests that have passed
my $passing = Test::More->builder->is_passing;

# Replace the number in the line below with the number of tests
if($passing == 1) {
  $test_result = 'true';
} else {
  $test_result = 'false';
}

my $url = "https://$username:$access_key\@saucelabs.com/rest/v1/$username/jobs/$job_id";

#TODO Replace with a better call to the sauce labs REST API
system "curl -u $username:$access_key -X PUT -H \"Content-Type: application/json\" -d '{\"passed\": $test_result}' $url"









