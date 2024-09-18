-module(ex1).
-export([fahrenheit_celsius/1,last_three_elements/1]).
-include_lib("eunit/include/eunit.hrl").
%Ejercicio 1.1
fahrenheit_celsius(X) ->
    (X - 32) * 5/9.

fahrenheit_celsius_test_() ->
    [
        ?_assert(fahrenheit_celsius(2) =:= -16.666666666666668),
        ?_assert(fahrenheit_celsius(89.6) =:= 31.999999999999999),
        ?_assert(fahrenheit_celsius(37.4) =:= 2.999999999999999)
    ].

%Ejercicio 1.2
last_three_elements([]) ->
    "Lista vacia";
last_three_elements([_]) ->
    "Un solo elemento";
last_three_elements([_,_]) ->
    "Dos elementos";
last_three_elements([A,B,C]) ->
    [A,B,C];
last_three_elements([_|T])->
    last_three_elements(T).

last_test_() ->
    [
        ?_assert(last_three_elements([]) =:= "Lista vacia"),
        ?_assert(last_three_elements([b]) =:= "Un solo elemento"),
        ?_assert(last_three_elements([a,b]) =:= "Dos elementos"),
        ?_assert(last_three_elements([b,b,b,b]) =:= [b,b,b]),
        ?_assert(last_three_elements([b,a,b,a]) =:= [a,b,a])
    ].