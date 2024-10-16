-module(ex3).
-export([comprim/1,empac/1,empac_aux/3]).


comprim(L) ->
    comprim(L,[]).
comprim([],L) ->
    class3:rev(L);
comprim([H|T],L)->
    case ex1_list:belongs(H,L) of
        true -> comprim(T,L);
        false -> comprim(T,[H|L])
    end.

empac_aux([],E,L) -> class3:rev([E|L]);
empac_aux([[H|T2]|T], E,L) when H == E ->
    list:append(class3:rev([[E|[H | T2]]|L]),T);
empac_aux([[H|T2]|T], E,L)  ->
    empac_aux(T,E,[[H|T2]|L]);
empac_aux([H|T],E,L) when H == E ->
    list:append(class3:rev([[H,E]|L]),T);
empac_aux([H|T],E,L) ->
    empac_aux(T,E,[H|L]).


empac(L) ->
    empac(L,[]).
empac([],L) ->
    L;
empac([H|T],L)->
    empac(T,empac_aux(L,H,[])).

    