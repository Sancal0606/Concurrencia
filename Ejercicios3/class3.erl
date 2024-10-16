-module(class3).
-export([fe/1,member/2,rev/1,del/2,qs/1]).

%Regresa el numero de elementos en una lista, contando las sublistas 
%{[1,2],3,4] regresa 4
fe(L)-> fe(L,0).
fe([H|T],N) when is_list(H) -> fe(T,N) + fe(H,0);
fe([_|T],N)  -> fe(T,N+1);
fe([],N) -> N.

%Revisa si un elemento esta en la lista
member(_,[]) -> false;
member(X,[X|_]) -> true;
member(X,[_|T]) -> member(X,T).

%Regresa la lista al reves
rev(L) -> rev(L,[]).
rev([H|T],A) -> rev(T, [H|A]);
rev([],A) -> A.

%Regresa una lista sin el primer parametro
del(X,[X|C]) -> C;
del(X,[E|C]) -> [E | del(X,C)];
del(_,[]) -> [].


%ordena la lista usando quicksort
qs([]) -> [];
qs([P|C]) ->
    {B,L} = sp(P,C),
    lists:append(qs(B), [P|qs(L)]).
sp(P,L) -> sp(P,L,[],[]).
sp(_,[],L1,L2) -> {L1,L2};
sp(P,[H|T],L1,L2) when H < P -> sp(P,T,[H|L1],L2);
sp(P,[H|T],L1,L2) -> sp(P,T,L1, [H|L2]).