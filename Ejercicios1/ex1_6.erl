-module (ex1_6).
-export([sum/2,sum_square/2,product/2]).
-include_lib("eunit/include/eunit.hrl").

sum(A,A) ->
    A;
sum(A,B) ->
    A + sum(A + 1,B).

sum_square(A,A) ->
    (A*A);
sum_square(A,B) ->
    (A*A) + sum_square(A + 1,B).


product(A,A) ->
    A;
product(A,B) ->
    A * product(A + 1,B).

sum_test_() ->
    [
        ?_assert(sum(0,5) =:= 15),
        ?_assert(sum(5,10) =:= 45),
        ?_assert(sum(24,37) =:= 427),
        ?_assert(sum(-12,24) =:= 222)
    ].

sum_square_test_() ->
    [
        ?_assert(sum_square(1,2) =:= 5),
        ?_assert(sum_square(1,5) =:= 55),
        ?_assert(sum_square(-5,5) =:= 110),
        ?_assert(sum_square(-4,22) =:= 3825)
    ].

product_test_() ->
    [
        ?_assert(product(1,5) =:= 120),
        ?_assert(product(3,8) =:= 20160),
        ?_assert(product(0,5) =:= 0),
        ?_assert(product(2,6) =:= 720)
    ].