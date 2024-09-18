-module(ex1).
-export([fahrenheit_celsius/1]).
-export([last_three_elements/1]).

%Ejercicio 1.1
fahrenheit_celsius(X) ->
    (X - 32) * 5/9.

%Ejercicio 1.2
last_three_elements([]) ->
    "Lista vacia";
last_three_elements([A,B,C]) ->
    [A,B,C];
last_three_elements([_|T])->
    last_three_elements(T).

