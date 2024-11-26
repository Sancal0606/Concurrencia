-module(ubanc).
-export([start/1, do_ub/2]).
-compile([export_all]).

%% Starts an ultrabank
start(Idb) ->
    Lb = [banc1:start(I) ||  I <- lists:seq(1,3) ],
    spawn(?MODULE, do_ub, [Lb, Idb]).


do_ub(Lb,Idb) ->
    receive
        {From,consulta} ->
            [Be ! {self(),consulta} || Be <- Lb],
            R = get_consulta_be(faster),
            From ! {Idb,R},
            flush(),
            do_ub(Lb,Idb)
    end.

get_consulta_be(faster) ->
    receive_one().

flush() ->
    receive
	_ ->
	    flush()
    after 0 ->
	      ok
    end.

receive_one() ->
    receive
	{_, R} -> R
    end.

consulta(B) ->
    B ! {self(), consulta},
    receive {_,D} -> D end.
	
