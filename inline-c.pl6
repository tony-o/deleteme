#!/usr/bin/env perl6

use Inline;

sub add(Int $a, Int $b) is inline('C') returns Int {'
  #include <stdio.h>

  DLLEXPORT int add (int a, int b) {
    printf("Adding %d + %d = %d\n", a, b, a + b);
    return a + b;
  }
'};

add(5,6).WHAT.say;
