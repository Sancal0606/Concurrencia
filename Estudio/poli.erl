-module(poli).
-export([evaluar/2,sum_poli/3,sub_poli/3,deriv/2,rev/1]).

evaluar([],_) ->
    0;
evaluar([H|T],P) ->
    evaluar(T,P) + H * stdy1:pow(P,stdy1:list_size(T)).

%Regresa la lista al reves
rev(L) -> rev(L,[]).
rev([H|T],A) -> rev(T, [H|A]);
rev([],A) -> A.

sum_poli([H],[H2],LR) ->
    rev([H + H2|LR]);
sum_poli([H|T], [H2|T2],LR) ->
    sum_poli(T,T2,[H + H2 | LR]).

sub_poli([H],[H2],LR) ->
    rev([H - H2|LR]);
sub_poli([H|T], [H2|T2],LR) ->
    sub_poli(T,T2,[H - H2 | LR]).

deriv([_],LR)->
    rev(LR);
deriv([H|T],LR) ->
    deriv(T,[H*stdy1:list_size(T)|LR]).