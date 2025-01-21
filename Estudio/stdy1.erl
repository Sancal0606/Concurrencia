-module(stdy1).
-export([fahr_cels/1,first_three/1,list_size/1,list_sum/2,list_belongs/2,list_all_equal/1,two_pow/1, sum/2,product/2,sum_square/2,pow/2]).

fahr_cels(C) ->
    (C - 32) * 5/9.

first_three([H|[H2|[H3|_]]]) ->
    [H,H2,H3].

list_size([]) ->
    0;
list_size([_|T]) ->
    1 + list_size(T).

list_sum([],X) ->
    X;
list_sum([H|T],X) ->
    list_sum(T,X + H).

list_belongs(E,[E|_]) ->
    true;
list_belongs(E,[_|T]) ->
    list_belongs(E,T);
list_belongs(_,[]) ->
    false.

list_all_equal([_]) ->
    true;
list_all_equal([H|[H|T]]) ->
    list_all_equal([H|T]);
list_all_equal([H|[H2|_]]) ->
    false.

two_pow(0) ->
    1;
two_pow(1) ->
    2;
two_pow(X) ->
    2 * two_pow(X - 1).

sum(A,A) ->
    A;
sum(A,B) ->
    A   + sum(A+1,B).

product(A,A) ->
    A;
product(A,B) ->
    A   * product(A+1,B).

sum_square(A,A) ->
    (A * A);
sum_square(A,B) ->
    (A * A) + sum_square(A+1,B).

pow(_,0) ->
    1;
pow(X,1) ->
    X;
pow(X,Y) when Y rem 2 == 1->
    X * pow(X, Y - 1);
pow(X,Y) ->
    A = pow(X, Y div 2),
    A * A.