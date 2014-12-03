#!/usr/bin/env perl6
use JSON::Tiny;
BEGIN {
my $repo = CompUnitRepo::Local::Installation.new('.test');
@*INC.unshift($repo);
};
my $repo = CompUnitRepo::Local::Installation.new('.test');
sub install(Str $meta) {
  my %data = %(from-json($meta.IO.slurp));
  $repo.install(dist => class :: {method metainfo { %data }}, |%data<provides>.values);
}

install 'lib/META6.json';
install 'zlib/META6.json';
install 'alib/META6.json';
install 'blib/META6.json';

my $c = $repo.candidates('a');

try 
{
  use a;
  a.o.say;
};

try
{
  use a:auth<zef:someotherguy>;
  a.o.say;
  b.o.say;
};
