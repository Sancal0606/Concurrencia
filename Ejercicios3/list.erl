-module(list).
-export([last/1,pc/2,append/2]).

last([H|[]]) -> H;
last([_|T]) -> last(T).

pcaux([],_,Lf) ->
    Lf;
pcaux([H|T],Le,Lf)->
    pcaux(T,Le,[{Le,H}|Lf]).

pc(L1,L2) -> pc(L1,L2,[]).
pc([],_,LR) -> class3:rev(LR);
pc([H1|T1],L2,LR) ->
    pc(T1,L2,append(pcaux(L2,H1,[]),LR)).


append(L1,L2)->append(L1,L2,class3:rev(L1)).
append(_,[],Lf)->
    class3:rev(Lf);
append(L1,[H|T],Lf)->
    append(L1,T,[H|Lf]).


