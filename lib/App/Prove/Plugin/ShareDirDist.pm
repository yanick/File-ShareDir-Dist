package App::Prove::Plugin::ShareDirDist;

use strict;
use warnings;
use 5.008001;
use File::Spec;
use File::Basename qw( basename );

# ABSTRACT: A prove plugin that works with File::ShareDir::Dist
# VERSION

=head1 SYNOPSIS

 % prove -PShreDirDist -lv t

=head1 DESCRIPTION

This plugin sets the override for L<File::ShareDir::Dist> based on
the current directory name, if there is a C<share> directory.  It
assumes that the directory name is the same as the dist name.  This
may not be the case, but it happens to be the convention that I use.

=cut

sub load
{
  my($class, $p) = @_;
  if(-d "share")
  {
    my $dist_name = basename(File::Spec->rel2abs("."));
    $ENV{PERL_FILE_SHAREDIR_DIST} = "$dist_name=share";
  }
}

1;
