-module(coursework).
-export([find_patterns/2]).


find_patterns(Data,[P]) -> [find_pattern(Data,P)];
find_patterns(Data,[P|Rest]) -> [find_pattern(Data,P)|find_patterns(Data,Rest)].

%-----

find_pattern(Data,Pattern) -> find_pattern_p(Data,Pattern,0).

%-----

find_pattern_p([],_Pattern,_I) -> [];

find_pattern_p([Head|Rest],Pattern,I) -> Data = [Head|Rest],
FirstPart = left(Data,length(Pattern)),
Check = string:equal(FirstPart,Pattern),

if
    Check ->
        [I|find_pattern_p(Rest,Pattern,I+1)];
    true ->
        find_pattern_p(Rest,Pattern,I+1)
end.

%-----

left([],_Number) -> [];
left([A|_RestOfData],1) -> [A];
left([A|RestOfData],Number) -> [A|left(RestOfData,Number-1)].

%-----