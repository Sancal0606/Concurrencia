-module (ej1).
-export([xy/2]).

xy(_,0) ->
    1;
xy(X,1) ->
    X;
xy(X, Y) when Y rem 2 == 1 ->
    X  * xy(X,Y - 1);
xy(X,Y) ->
    xy(X, Y div 2) * xy(X, Y div 2).