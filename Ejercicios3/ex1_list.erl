-module(ex1_list).
-export([length_list/1,addl/1,belongs/2,allequal/1]).
-include_lib("eunit/include/eunit.hrl").

%Ejercicio 1.3.a
length_list([]) ->
    0;
length_list([_|T])->
    1 + length_list(T).

length_test_() ->
    [
        ?_assert(length_list([a,b,c]) =:= 3),
        ?_assert(length_list([a]) =:= 1),
        ?_assert(length_list([]) =:= 0),
        ?_assert(length_list([a,b,c,d,e,f]) =:= 6)
    ].

%Ejercicio 1.3.b
addl([]) ->
    0;
addl([S|T])->
    S + addl(T).

addl_test_() ->
    [
        ?_assert(addl([1,2,3]) =:= 6),
        ?_assert(addl([-1,-2,-3]) =:= -6),
        ?_assert(addl([100,582,24]) =:= 706),
        ?_assert(addl([]) =:= 0)
    ].

%Ejercicio 1.3.c
belongs(_,[]) -> false;
belongs(E,[E|_]) -> true;
belongs(E,[_|T]) ->
    belongs(E,T).

belongs_test_() ->
    [
        ?_assert(belongs(a,[a,b,c]) =:= true),
        ?_assert(belongs(a,[b,b,b]) =:= false),
        ?_assert(belongs(va,[ba,va,er]) =:= true),
        ?_assert(belongs(ev,[ba,va,er]) =:= false)
    ].

%Ejercicio 1.3.d
allequal([]) -> true;
allequal([E]) -> true;
allequal([E,E]) -> true;
allequal([A,B]) -> false;
allequal( [D|[D|T]]) -> allequal([D|T]);
allequal( [D|[F|T]]) -> false.

allequal_test_() ->
    [
        ?_assert(allequal([]) =:= true),
        ?_assert(allequal([b]) =:= true),
        ?_assert(allequal([b,b,b,b]) =:= true),
        ?_assert(allequal([b,b,b,a]) =:= false)
    ].




