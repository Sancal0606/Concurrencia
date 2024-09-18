-module(ex1_list).
-export([length_list/1]).
-export([addl/1]).
-export([belongs/2]).
-export([allequal/1]).

%Ejercicio 1.3.a
length_list([]) ->
    0;
length_list([_|T])->
    1 + length_list(T).

%Ejercicio 1.3.b
addl([]) ->
    0;
addl([S|T])->
    S + addl(T).

%Ejercicio 1.3.c
belongs(_,[]) -> false;
belongs(E,[E|_]) -> true;
belongs(E,[_|T]) ->
    belongs(E,T).

%Ejercicio 1.3.d
allequal([]) -> true;
allequal([E]) -> true;
allequal([E,E]) -> true;
allequal([A,B]) -> false;
allequal( [D|[D|T]]) -> allequal([D|T]);
allequal( [D|[F|T]]) -> false.



