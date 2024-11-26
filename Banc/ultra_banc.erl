-module(ultra_banc).
-export([start/1, do_ub/2]).
-compile([export_all]).

%Starts an ultrabank
start(Idb) ->
    Lb = [banc:start(I) || I <- lists:seq(1,3)],
    spawn(?MODULE,do_ub,[Lb,Idb]).

do_ub(Lb,Idb) ->
    receive
        {From,consulta} ->
            [Be ! {self(),consulta} || Be <- Lb],
            R = get_consulta_be(faster),
            From ! {Idb,R},
            flush(),
            do_ub(Lb,Idb)
    end.

flush() ->
    receive
	_ ->
	    flush()
    after 0 ->
	      ok
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