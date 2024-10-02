-module(poli).
-export([evaluar/2,derivada/1,sumPoli/2,subPoli/2]).

evaluar([],_) ->
    0;
evaluar([H|T],P) ->
    evaluar(T,P) + H * ej1:xy(P,ex1_list:length_list(T)). 

derivada(L) -> derivada(L,[]).
derivada([],L) -> L;
derivada([H|T],L) -> derivada(T,[H|L]).

sumPoli(L1,L2) ->
    2.

subPoli(L1,L2) ->
    2.