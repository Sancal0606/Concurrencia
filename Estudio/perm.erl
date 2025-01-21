-module(perm).
-export([insert_at/4,insert_everywhere/2,insert_all/3,perm/1]).

insert_at(L,E,X,Lf) when X == 0->
    list:append(L,[E|Lf]);
insert_at([H|T],E,X,Lf) ->
    insert_at(T,E,X-1,[H|Lf]).

insert_everywhere(L,E)->
    insert_everywhere(L,E,[],stdy1:list_size(L)).
insert_everywhere(L,E,Lf,0) ->
    [insert_at(L,E,0,[])|Lf];
insert_everywhere(L,E,Lf,N) ->
    insert_everywhere(L,E,[insert_at(L,E,N,[])|Lf],N -1).

insert_all(_,[],Lf) ->
    Lf;
insert_all(A,[H|T],Lf) ->
    insert_all(A,T,list:append(Lf,insert_everywhere(H,A))).

perm(L) ->
    perm(L,[[]]).
perm([],Lf)->
    Lf;
perm([H|T],Lf)->
    perm(T,insert_all(H,Lf,[])).
