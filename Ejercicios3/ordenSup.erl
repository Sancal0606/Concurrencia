-module(ordenSup).
-export([complementario/1,composicion/2,fixed_point/1]).

complementario(F) ->
    fun(X) -> not F(X) end.

composicion(F,G) ->
    A = fun(X) -> F(G(X)) end,
    B = fun(X) -> G(F(X)) end,
    [A,B].
    
fixed_point(F) ->
    fixed_point(F,0.5).
fixed_point(F,X) ->
    case F(X) - X < 0.01 of
        true -> X;
        false -> fixed_point(F,F(X))
    end.

    