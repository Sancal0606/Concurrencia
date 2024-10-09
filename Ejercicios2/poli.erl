-module(poli).
-export([evaluar/2,derivada/1,sumPoli/2,subPoli/2]).

evaluar([],_) ->
    0;
evaluar([H|T],P) ->
    evaluar(T,P) + H * ej1:xy(P,ex1_list:length_list(T)). 

derivada(L) -> derivada(L,[]).
derivada([],[_|T]) -> class3:rev(T);
derivada([H|T],L) -> 
    derivada(T,[H*ex1_list:length_list(T)|L]).

sumPoli(L1,L2) -> sumPoli(L1,L2,[]).
sumPoli([],[],LR) -> class3:rev(LR);
sumPoli([H1|T1],[H2|T2],LR) ->
    sumPoli(T1,T2,[H1+H2|LR]).

subPoli(L1,L2) -> subPoli(L1,L2,[]).
subPoli([],[],LR) -> class3:rev(LR);
subPoli([H1|T1],[H2|T2],LR) ->
    subPoli(T1,T2,[H1-H2|LR]).