-module(ubanc).
-compile([export_all]).

start(Idb) ->
    Lb = [banc:start(I)||I <- lists:seq(1,3)],
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

flush()->
    receive
        _ -> flush()
    after
        0 -> ok
    end.

get_consulta_be(faster) ->
    {_,Q} = receive_one(),Q.


receive_one() -> 
    receive
        {B,Q} -> {B,Q} 
    end.

consulta(B) ->
    B ! {self(),consulta},
    receive
        X -> X
    end.