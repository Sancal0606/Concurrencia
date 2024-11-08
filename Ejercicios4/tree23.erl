-module(tree23).
-export([insert/2]).

%[i,[g,[],[]],[o,[l,[],[]],[{rt},[],[],[]]]]
insert([[],[],[]],I) ->
    [I,[],[]];
insert([{X,Y},[],[],[]],I) when X >= I ->
    io:format("d3: ~w  \n",[Y]),
    [X,[I,[],[]],[Y,[],[]]];
insert([{X,Y},[],[],[]],I) when Y < I ->
    io:format("d4: ~w  \n",[Y]),
    [Y,[X,[],[]],[I,[],[]]];
insert([{X,Y},[],[],[]],I)  ->
    io:format("d2: ~w  \n",[Y]),
    [I,[X,[],[]],[Y,[],[]]];

insert([V|[[]|[[]|_]]],I) when I < V->
    io:format("d7: ~w ~w \n",[I,V]),
    [{I,V},[],[],[]];
insert([V|[[]|[[]|_]]],I) when I >= V->
    io:format("d8: ~w  \n",[V]),
    [{V,I},[],[],[]];

insert([{X,Y}|[H1|[H2|[H3|[]]]]],I) when X >= I ->
    %Left
    L = insert(H1,I),
    kick_up(L,[{X,Y}|[H1|[H2|[H3|[]]]]],I);
    %io:format("d:~w , ~w., ~w \n",[NV, NH1, NH2]), 
    %[X,[NV,NH1,NH2],[Y,H2,H3]];
insert([{X,Y}|[H1|[H2|[H3|[]]]]],I) when Y < I ->
    %Right
    L = insert(H3,I),
    io:format("right:~w , ~w \n",[H3,I]),
    kick_up(L,[{X,Y}|[H1|[H2|[H3|[]]]]],I);
    %io:format("d:~w , ~w., ~w \n",[NV, NH1, NH2]), 
    %[Y,[X,H1,H2],[NV,NH1,NH2]];
insert([{X,Y}|[H1|[H2|[H3|[]]]]],I) ->
    %Center
    io:format("center:~w , ~w \n",[H2,I]),
    L = insert(H2,I),
    kick_up(L,[{X,Y}|[H1|[H2|[H3|[]]]]],I);
    %io:format("d:~w , ~w., ~w \n",[NV, NH1, NH2]), 
    %[NV,[X,H1,NH1],[Y,NH2,H3]];

insert([V|[H1|[H2|_]]],I) when V >= I ->
    %Left
    io:format("l \n",[]),
    L = insert(H1,I),
    kick_up(L,[V|[H1|[H2]]],I);
    %[{NV,V},NH1,NH2,H2];
insert([V|[H1|[H2|_]]],I) when V < I ->
    %Right
    io:format("r \n",[]),
    L = insert(H2,I),
    kick_up(L,[V|[H1|[H2]]],I).
    %[NV|[NH1|[NH2|_]]] = insert(H2,I),
    %io:format("d: ~w  ~w , ~w., ~w \n",[V, NV, NH1, NH2]),
    %[{V,NV},H1,NH1,NH2].   

kick_up([{NX,NY}|[NH1|[NH2|[NH3|_]]]], [{X,Y}|[_|[H2|[H3|[]]]]],I) when X >= I ->
    %Left
    [{X,Y}|[[{NX,NY}|[NH1|[NH2|[NH3]]]]|[H2|[H3|[]]]]];
kick_up([NV|[NH1|[NH2|_]]], [{X,Y}|[_|[H2|[H3|[]]]]],I) when X >= I ->
    %Left
    [X,[NV,NH1,NH2],[Y,H2,H3]];

kick_up([{NX,NY}|[NH1|[NH2|[NH3|_]]]], [{X,Y}|[H1|[H2|[_|[]]]]],I) when Y < I ->
    %Right
    [{X,Y}|[H1|[H2|[[{NX,NY}|[NH1|[NH2|[NH3]]]]|[]]]]];
    %[{X,Y}|[H1|[H2|[{NX,NY}|[NH1|[NH2|[NH3]]]]]]];
kick_up([NV|[NH1|[NH2|_]]], [{X,Y}|[H1|[H2|[_|[]]]]],I) when Y < I ->
    %Right
    [Y,[X,H1,H2],[NV,NH1,NH2]];

kick_up([{NX,NY}|[NH1|[NH2|[NH3|_]]]],[{X,Y}|[H1|[_|[H3|[]]]]],_) ->
    %Center
    [{X,Y}|[H1|[[{NX,NY}|[NH1|[NH2|[NH3]]]]|[H3|[]]]]];
kick_up([NV|[NH1|[NH2|_]]],[{X,Y}|[H1|[_|[H3|[]]]]],_) ->
    %Center
    [NV,[X,H1,NH1],[Y,NH2,H3]];

kick_up([{X,Y}|[NH1|[NH2|[NH3|_]]]],[V|[_|[H2|_]]],I)  when V >= I ->
    %Right
    [V|[[{X,Y}|[NH1|[NH2|[NH3]]]]|[H2]]];
kick_up([NV|[NH1|[NH2|_]]],[V|[_|[H2|_]]],I)  when V >= I ->
    %Right
    [{NV,V},NH1,NH2,H2];

kick_up([{X,Y}|[NH1|[NH2|[NH3|_]]]],[V|[H1|_]], I)  when V < I ->
    %Left
    io:format("d: ~w  \n",[V]),
    [V|[H1|[[{X,Y}|[NH1|[NH2|[NH3]]]]]]];
kick_up([NV|[NH1|[NH2|_]]],[V|[H1|_]], I)  when V < I ->
    %Left
    io:format("d: ~w  ~w , ~w., ~w \n",[V, NV, NH1, NH2]),
    [{V,NV},H1,NH1,NH2].