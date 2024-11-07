-module(ex4).
-export([list_even/1,list_square/1,
    list_even_square/1,fold_tree/3, sum_tree/1]).

list_even(N) ->
    [T || T <- N, T rem 2 == 0].

list_square(N) ->
    [T * T || T <- N].

list_even_square(N) ->
    [T * T || T <- N, T rem 2 == 0].





fold_tree(F,I,L) ->
    F(I,fold_tree(F,L)).
fold_tree(_,[V|[[]|[[]]]]) ->
    V;
fold_tree(F,[V|[[]|[H3|_]]]) ->
    B = fold_tree(F,H3),
    F(B,V);
fold_tree(F,[V|[H2|[[]|_]]]) ->
    A = fold_tree(F,H2),
    F(A,V);
fold_tree(F,[V|[H2|[H3|_]]]) ->
    A = fold_tree(F,H2),
    B = fold_tree(F,H3),
    F(F(A,B),V).

sum_tree(L) ->
    fold_tree(
        fun(Ac,V) -> Ac * V  end,
        1,L).

