-module(ex3).
-export([comprime/2,empac/2,complement/1,composition/2,num_nodes/1,num_leaves/1,max_depth/1,post_ord/2]).

list_belongs(E,[E|_]) ->
    true;
list_belongs(E,[_|T]) ->
    list_belongs(E,T);
list_belongs(_,[]) ->
    false.
%Regresa la lista al reves
rev(L) -> rev(L,[]).
rev([H|T],A) -> rev(T, [H|A]);
rev([],A) -> A.


comprime([],Lf) ->
    rev(Lf);
comprime([H|T],Lf) ->
    case list_belongs(H,Lf) of
        true -> comprime(T,Lf);
        false -> comprime(T,[H|Lf])
    end.

empac([],Lf)->
    rev(Lf);
empac([H|T],[[H|Tf]|Lf])->
    empac(T,[[H|[H|Tf]]|Lf]);
empac([H|T],[H|Lf]) ->
    empac(T,[[H,H]|Lf]);
empac([H|T],Lf) ->
    empac(T,[H|Lf]).

complement(F)->
    fun(X) -> not F(X) end.

composition(F,G)->
    fun(X) -> F(G(X)) end.

num_nodes([])->
    0;
num_nodes([_,Lf,Rg])->
    1 + num_nodes(Lf) + num_nodes(Rg).

num_leaves([])->
    0;
num_leaves([_,[],[]])->
    1;
num_leaves([_,Lf,Rg])->
    num_leaves(Lf) + num_leaves(Rg).

max_depth([])->
    0;
max_depth([_,Ll,Rl]) ->
    DL = max_depth(Ll),
    DR = max_depth(Rl),
    case DL > DR of
        true -> 1 + DL;
        false -> 1 + DR
    end.


post_ord(_,[])->
    0;
post_ord(F,[V,Ll,Rl]) ->
    post_ord(F,Ll),
    post_ord(F,Rl),
    F(V).
