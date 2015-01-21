package My::ModuleBuild;

use strict;
use warnings;
use base qw( Module::Build );

sub new
{
  my($class, %args) = @_;
  
  if($^O =~ /^(cygwin|MSWin32)$/)
  {
    $args{include_dirs} = 'include';
  }
  else
  {
    $args{xs_files} = {};
  }
  
  my $self = $class->SUPER::new(%args);
  $self;
}

1;
