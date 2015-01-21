use strict;
use warnings;
use Test::More tests => 1;
use Win32::Getppid ();

my $ppid = Win32::Getppid::getppid;

like $ppid, qr{^[0-9]+$}, "ppid = $ppid"
