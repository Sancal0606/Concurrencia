-module(ultra_bank).
-export([]).
-compile([export_all]).

%Starts an ultrabank
start(Idb) ->
    Lb = [bancl:start(I) || I <- lists:seq(1,3)],
    spawn(?MODULE,do_op,[Lb,Idb]).

do_ub(Lb,Idb) ->
    receive
        {From,consult} ->
            [Be ! {self(),consulta} || Be <- Lb],
            R = get_consulta_be(faster),
            From ! {Idb,R},
            flush(),
            do_ub(Lb,Idb)
    end.

get_consulta_be(faster) ->
    {_,Q} = receive_one(),Q;
get_consulta_be(consens) ->
    R = [receive_one() || _ <- lists:seq(1,3)],
    F = freq(R),
    case map_size(F) of
        l -> [Q] = maps:keys(F), Q;
        _ -> no_consens
    end.

receive_one() -> receive {B,Q} -> {B,Q} end.
freq([]) -> #{};
freq([{_,Q}|R]) ->
    M = freq(R),
    V = maps:get(Q,M,0) + 1,
    M#{Q => V}.