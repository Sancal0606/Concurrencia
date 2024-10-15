-module(prueba).
-export([sum/1, max_min/1,sum_arb/1]).

sum([]) ->
    0;
sum([H | T]) ->
    sum(H) + sum(T);
sum(E) ->
    E.

max_min(L) ->
    lists:foldl(
        fun
            ({Min, Max}, V) when V < Min ->
                {V, Max};
            ({Min, Max}, V) when V > Max ->
                {Min, V};
            ({Min, Max}, _) ->
                {Min, Max}
        end,
        {0, 0},
        L
    ).

sum_arb([])->
    [];
sum_arb([H|[[]|[[]|_]]]) ->
    H;
sum_arb([H|[Fi|[Fd|_]]])->
    sum_arb(Fi) + sum_arb(Fd).
