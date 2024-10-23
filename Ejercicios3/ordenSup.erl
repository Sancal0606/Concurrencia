-module(ordenSup).
-export([complementario/1,composicion/2,fixed_point/1,vectorize/1,
    traca/1,num_nodes/1,num_leaves/1,max_depth/1,postordre/2]).

complementario(F) ->
    fun(X) -> not F(X) end.

composicion(F,G) ->
    A = fun(X) -> F(G(X)) end,
    A.
    
fixed_point(F) ->
    fixed_point(F,0.5).
fixed_point(F,X) ->
    case F(X) - X < 0.01 of
        true -> X;
        false -> fixed_point(F,F(X))
    end.

vect_aux(_,[],L) ->
    class3:rev(L);
vect_aux(F,[H|T],L) ->
    vect_aux(F,T,[F(H)|L]).
vectorize(F) ->
    fun(X) -> vect_aux(F,X,[]) end.

traca(F) ->
    fun(P) ->
        R = F(P),
        io:format("~w the argumente is ~w and the result is ~w.~n", [?FUNCTION_NAME,P,R]) end.

num_nodes([])->
    0;
num_nodes([_|[H2|[H3|_]]]) ->
    1 + num_nodes(H2) + num_nodes(H3).

num_leaves([])->
    0;
num_leaves([_|[[]|[[]|_]]])->
    1;
num_leaves([_|[H2|[H3|_]]]) ->
    num_leaves(H2) + num_leaves(H3).

max_depth([])->
    0;
max_depth([_|[H2|[H3|_]]]) ->
    D1 = max_depth(H2),
    D2 = max_depth(H3),
    case D1 < D2 of
        true -> 1 + D2;
        false -> 1 + D1
    end.

postordre(_,[])->
    0;
postordre(F,[V|[H2|[H3|_]]]) ->
    postordre(F,H2),
    postordre(F,H3),
    F(V).




    

    