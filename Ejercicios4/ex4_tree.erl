-module(ex4_tree).
-export([insert/2,tree_min/1,has_value/2,build_tree/1]).

insert([[],[],[]],I) ->
    %Base Case
    [[I,[],[]],false];
insert([],I) ->
    %Base Case
    [[I,[],[]],false];
insert([{X,Y}|[H1|[H2|[H3]]]],I) when X >= I ->
    %Two values-Left
    [L,F] = insert(H1,I),
    case F of 
      true -> [[{X,Y}|[L|[H2|[H3]]]],true]; 
      false -> kick_up(L,[{X,Y}|[H1|[H2|[H3]]]],I) 
    end;
insert([{X,Y}|[H1|[H2|[H3]]]],I) when Y < I ->
    %Two values-Right
    [L,F] = insert(H3,I),
    case F of
        true -> [[{X,Y}|[H1|[H2|[L]]]],true];
        false -> kick_up(L,[{X,Y}|[H1|[H2|[H3]]]],I)
    end;
insert([{X,Y}|[H1|[H2|[H3]]]],I) ->
    %Two values-Center
    [L,F] = insert(H2,I),
    case F of
        true -> [[{X,Y}|[H1|[L|[H3]]]],true];
        false -> kick_up(L,[{X,Y}|[H1|[H2|[H3]]]],I)
    end;
insert([V|[H1|[H2]]],I) when V >= I ->
    %One value-Left
    [L,F] = insert(H1,I),
    case F of
        true -> [[V|[L|[H2]]],true];
        false -> kick_up(L,[V|[H1|[H2]]],I)
    end;
insert([V|[H1|[H2]]],I) when V < I ->
    %One value-Right
    [L,F] = insert(H2,I),
    case F of
        true -> [[V|[H1|[L]]],true];
        false -> kick_up(L,[V|[H1|[H2]]],I)
    end.

kick_up([NV|[NH1|[NH2]]],[{X,Y}|[_|[H2|[H3]]]],I) when X >= I ->
    %Two values-Left
    [[X,[NV,NH1,NH2],[Y,H2,H3]],false];
kick_up([NV|[NH1|[NH2]]],[{X,Y}|[H1|[H2|[_]]]],I) when Y < I ->
    %Two values-Right
    [[Y,[X,H1,H2],[NV,NH1,NH2]],false];
kick_up([NV|[NH1|[NH2]]],[{X,Y}|[H1|[_|[H3]]]],_) ->
    %Two values-Center
    [[NV,[X,H1,NH1],[Y,NH2,H3]],false];
kick_up([NV|[NH1|[NH2]]],[V|[_|[H2]]],I) when V >= I ->
    %One value-Left
    [[{NV,V},NH1,NH2,H2],true];
kick_up([NV|[NH1|[NH2]]],[V|[H1|[_]]],I) when V < I ->
    %One value-Right
    [[{V,NV},H1,NH1,NH2],true].

tree_min([V,[],[]]) ->
    V;
tree_min([_|[H1|[_|_]]]) ->
    tree_min(H1).

has_value([],_) ->
    false;
has_value([[]],_) ->
    false;
has_value([[V|[[]|[[]]]]],I) when not(V == I) ->
    false;
has_value([V|[_|[_]]],I) when V == I ->
    true;
has_value([{X,Y}|[_|[_|[_]]]],I) when (X == I) or (Y == I) ->
    true;
has_value([_|[H1|[H2]]],I)->
    has_value(H1,I) or has_value(H2,I);
has_value([{_,_}|[H1|[H2|H3]]],I)  ->
    has_value(H1,I) or has_value(H2,I) or has_value(H3,I).

build_tree(L) ->
    build_tree(L,[]).
build_tree([],L) ->
    L;
build_tree([H|T],L) ->
    [V,_] = insert(L,H),
    build_tree(T,V).
