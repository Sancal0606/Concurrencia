-module(ex4).
-export([list_even/1,list_square/1,list_square_even/1]).

list_even(N) ->
    [V ||V <- N , V rem 2 == 0 ].

list_square(N) ->
    [V * V || V <- N].

list_square_even(N) ->
    list_even(list_square(N)).