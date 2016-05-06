package Win32::Getppid;

use strict;
use warnings;
use 5.008001;
use base qw( Exporter );

BEGIN {

# ABSTRACT: Implementation of getppid() for windows
# VERSION

  if($^O =~ /^(cygwin|MSWin32|msys)$/)
  {
    require XSLoader;
    XSLoader::load('Win32::Getppid', $Win32::Getppid::VERSION);
  }

}

our @EXPORT;
our @EXPORT_OK;

if($^O eq 'MSWin32')
{
  @EXPORT = qw( getppid );
  @EXPORT_OK = qw( getppid );
}
elsif($^O =~ /^(cygwin|msys)$/)
{
  @EXPORT_OK = qw( getppid );
}
else
{
  @EXPORT_OK = qw( getppid );
  if(eval q{ require 5.016 })
  {
    *getppid = \&CORE::getppid;
  }
  else
  {
    *getppid = sub {
      package
        Win32::Getppid::sandbox;
      getppid();
    };
  }
}

=head1 SYNOPSIS

 use Win32::Getppid;
 
 my $parent_pid = getppid;

=head1 DESCRIPTION

This module simply provides an implementation of L<getppid|perlfunc#getppid> for
Windows, where it is usually missing.  It doesn't do anything on non-Windows
platforms, so you can safely make it a non-OS specific dependency for your
CPAN module.

=head1 FUNCTIONS

=head2 getppid

Returns the parent process id for the current process.  This is imported by
default only in a real Windows environment (C<$^O eq 'MSWin32'>).  On Cygwin
getppid returns the cygwin parent process, for the real windows parent
process id on cygwin you can use the fully qualified version:

 my $windows_ppid = Win32::Getppid::getppid();

=cut

1;
