-module(perm).
-export([insert_at/4,insert_everywhere/2,perm/1,insert_all/3]).


insert_at(A,F,N,L) when N == 0 ->
    list:append(L,[A|F]);
insert_at(A,[H|T],N,L) ->
    insert_at(A,T,N-1,[H|L]).

insert_everywhere(A,L)->
    insert_everywhere(A,L,ex1_list:length_list(L),[]).

insert_everywhere(_,_,N,Lf) when N < 0 -> Lf;
insert_everywhere(A,L,N,Lf) -> 
    insert_everywhere(A,L,N-1,[insert_at(A,L,N,[])|Lf]).

insert_all([],_,Lf) ->
    Lf;
insert_all([H|T],A,Lf) ->
    insert_all(T,A,list:append(Lf,insert_everywhere(A,H))).

perm(L)->
    perm(L,[[]]).
perm([],Lf) -> Lf;
perm([H|T],Lf) ->
    perm(T,insert_all(Lf,H,[])).

