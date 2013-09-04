#!/usr/bin/env perl
use 5.010;
use warnings;
use utf8;
use Encode qw/encode_utf8/;

use UnazuSan;

my $unazu_san = UnazuSan->new(
    host       => 'example.com',
    password   => 'xxxxxxxx',
    enable_ssl => 1,
    join_channels => [qw/test/],
);

$unazu_san->on_message(
    qr/^\s*unazu_san:/ => sub {
        my $receive = shift;
        $receive->reply('うんうん');
    },
    qr/(.)/ => sub {
        my ($receive, $match) = @_;
        say $match;
        say $receive->message;
    },
);

$unazu_san->run;
