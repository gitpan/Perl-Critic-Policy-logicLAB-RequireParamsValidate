# Courtesy of Jeffrey Ryan Thalhammer
# http://search.cpan.org/~thaljef/Test-Perl-Critic/lib/Test/Perl/Critic.pm

# The severity parameter interpretation was added by jonasbn
# See: http://logiclab.jira.com/wiki/display/OPEN/Test-Perl-Critic

# $Id: critic.t 7504 2011-03-02 21:30:42Z jonasbn $

# $HeadURL: https://logiclab.jira.com/svn/PCPMPUL/trunk/t/critic.t $

use strict;
use warnings;
use File::Spec;
use Test::More;
use English qw(-no_match_vars);
use Test::Perl::Critic;

our $VERSION = '1.00';

if ( not $ENV{TEST_CRITIC} ) {
    my $msg = 'Author test.  Set $ENV{TEST_CRITIC} to a true value to run.';
    plan( skip_all => $msg );
}

my $rcfile = File::Spec->catfile( 't', 'perlcriticrc' );

Test::Perl::Critic->import(
    -profile => $rcfile,
    -severity => ($ENV{TEST_CRITIC} and $ENV{TEST_CRITIC} >= 0 and $ENV{TEST_CRITIC} <= 5) ? $ENV{TEST_CRITIC} : 5
);

all_critic_ok();

__END__

=pod

=head1 NAME

critic.t - a unit test from Test::Perl::Critic

=head1 DESCRIPTION

This test checks your code against Perl::Critic, which is a implementation of
a subset of the Perl Best Practices.

It's severity can be controlled using the severity parameter in the use
statement. 1 being the lowest and 5 being the highests.

Setting the severity lower, indicates level of strictness

Over the following range:

gentle, stern, harsh, cruel, brutal

So gentle would only catch severity 5 issues.

Since this tests tests all packages in your distribution, perlcritic
commandline tool can be used in addition.

L<perlcritic>

=cut