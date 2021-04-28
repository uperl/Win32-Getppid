# Win32::Getppid ![linux](https://github.com/uperl/Win32-Getppid/workflows/linux/badge.svg) ![macos](https://github.com/uperl/Win32-Getppid/workflows/macos/badge.svg) ![windows](https://github.com/uperl/Win32-Getppid/workflows/windows/badge.svg) ![cygwin](https://github.com/uperl/Win32-Getppid/workflows/cygwin/badge.svg) ![msys2-mingw](https://github.com/uperl/Win32-Getppid/workflows/msys2-mingw/badge.svg)

Implementation of getppid() for windows

# SYNOPSIS

```perl
use Win32::Getppid;

my $parent_pid = getppid;
```

# DESCRIPTION

This module simply provides an implementation of [getppid](https://metacpan.org/pod/perlfunc#getppid) for
Windows, where it is usually missing.  It doesn't do anything on non-Windows
platforms, so you can safely make it a non-OS specific dependency for your
CPAN module.

# FUNCTIONS

## getppid

Returns the parent process id for the current process.  This is imported by
default only in a real Windows environment (`$^O eq 'MSWin32'`).  On Cygwin
getppid returns the cygwin parent process, for the real windows parent
process id on cygwin you can use the fully qualified version:

```perl
my $windows_ppid = Win32::Getppid::getppid();
```

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
