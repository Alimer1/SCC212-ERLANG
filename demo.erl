-module(demo).
-export([fact/1,convert/1,is_leap_year/1,list_size/1,list_max/1]).

%This is a comment

fact(N) when N < 1 -> 1;
fact(N) -> N * fact(N - 1).

%----------------------------

convert({c,Value}) -> NewValue = (Value * (9/5)) + 32,
{f,NewValue};
convert({f,Value}) -> NewValue = (Value - 32) * (5/9),
{c,NewValue};
convert(_Other) -> {error,invalid_object}.

%----------------------------

is_leap_year(N) -> 0 == N rem 4.

%----------------------------

list_size([]) -> 0;
list_size([A|RestOfList]) -> 1 + list_size(RestOfList).

%----------------------------

list_max([]) -> 0;
list_max([A]) -> A;
list_max([A|RestOfList]) -> max(A,list_max(RestOfList)).