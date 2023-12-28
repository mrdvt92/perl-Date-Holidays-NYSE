# - perl -
use strict;
use warnings;
use Data::Dumper qw{Dumper};
use Test::More tests => 8;
use Date::Holidays::NYSE qw{is_holiday};
use Date::Holidays::NYSE qw{is_us_holiday};
use Date::Holidays::NYSE qw{holidays};
use Date::Holidays::NYSE qw{us_holidays};

{
  my $name = q{New Year's Day};

  ok(!is_holiday(2024,8,19));

  my $holidays = holidays(2024);
  #diag(Dumper $holidays);

  is(is_holiday(2024,1,1), $name);
  ok(exists $holidays->{'0101'});
  is($holidays->{'0101'}, $name);
}

{
  my $name = q{New Year's Day};

  ok(!is_us_holiday(2024,8,19));

  my $holidays = us_holidays(2024);
  #diag(Dumper $holidays);

  is(is_us_holiday(2024,1,1), $name);
  ok(exists $holidays->{'0101'});
  is($holidays->{'0101'}, $name);
}
