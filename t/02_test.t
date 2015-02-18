use strict;
use warnings;
use Test::More tests => 1;
use Sys::Hostname;

foreach my $key (sort keys %ENV)
{
  note "$key = $ENV{$key}\n";
}

note "hostname = ", hostname();

pass 'good';
