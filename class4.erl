-module (class4).
-export ([mapa/1]).


mapa(L) ->
    lists:map(fun(X) ->
        X + 1
    end,L).