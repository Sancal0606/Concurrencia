-module(ex4).
-export([list_even/1,list_square/1,list_even_square/1]).

list_even(N) ->
    [T || T <- N, T rem 2 == 0].

list_square(N) ->
    [T * T || T <- N].

list_even_square(N) ->
    [T * T || T <- N, T rem 2 == 0].
