#!/usr/bin/perl -w

use strict;
use Ogg::Vorbis::Header::PurePerl;

if (!$ARGV[0])
{
    print "Usage: ogginfo.pl filename\n";
    exit;
}

my $fn = $ARGV[0];

if (!-e $fn)
{
    print "File does not exist\n";
    exit;
}

my $ogg = Ogg::Vorbis::Header::PurePerl->new($fn);

$ogg->load;

foreach my $k (keys %{$ogg->info})
{
    print $k, '=', $ogg->info->{$k}, "\n";
}

foreach my $k ($ogg->comment_tags())
{
    foreach my $cmmt ($ogg->comment($k))
    {
	print $k, '=', $cmmt, "\n";
    }
}


