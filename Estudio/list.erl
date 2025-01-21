-module(list).
-export([last/1,pc/3,append/2,paux/3]).

last([H])->
    H;
last([_|T])->
    last(T).

append(L1,L2) ->
    append(L1,L2,poli:rev(L1)).
append(_,[],Lf) ->
    poli:rev(Lf);
append(L1,[H|T],Lf)->
    append(L1,T,[H|Lf]).

paux(_,[],LR)->
    LR;
paux(E,[H|T],LR) ->
    paux(E,T,[{E,H}|LR]).

pc([],_,LR) ->
    poli:rev(LR);
pc([H|T],L,LR)->
    pc(T,L,append(paux(H,L,[]),LR)).
