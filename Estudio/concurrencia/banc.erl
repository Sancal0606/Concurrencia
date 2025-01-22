-module(banc).
-export([start/1,do_op/3,consulta/1,ingreso/2,reintegra/2]).

start(Idb)->
    spawn(?MODULE,do_op,[0,Idb,true]).

do_op(D,Idb,status) ->
    receive
        {From, consulta} ->
            estado = false,
            timeWait = wait(),
            if timeWait >= 5 ->
                noRespuesta;
            true ->
                timer:sleep(timeWait)
            end,
            From ! {Idb,D},
            do_op(D,Idb,estado);
        {From, ingreso, Q} ->
            estado = false,
            timeWait = wait(),
            if timeWait >= 5 ->
                noRespuesta;
            true ->
                timer:sleep(timeWait)
            end,
            D2 = D + Q,
            From ! {Idb,D2},
            do_op(D2,Idb,estado);
        {From, reintegra, Q} when Q =< D ->
            estado = false,
            timeWait = wait(),
            if timeWait >= 5 ->
                noRespuesta;
            true ->
                timer:sleep(timeWait)
            end,  
            D2 = D - Q,
            From ! {Idb,D2},
            do_op(D2,Idb,estado);
        {From, reintegra, _} ->
            estado = false,
            timeWait = wait(),
            if timeWait >= 5 ->
                noRespuesta;
            true ->
                timer:sleep(timeWait)
            end,
            From ! {Idb,denegada},
            do_op(D,Idb,estado)
        
    end.

wait() ->
    1000 * trunc(2 * math:pow(-math:log(1 - rand:uniform()), 0.5)).

consulta(B) ->
    B ! {self(),consulta},
    receive
        {_,X} -> X
    end.

ingreso(B,Q) ->
    B ! {self(),ingreso,Q},
    receive
        {_,X} -> X
    end.

reintegra(B,Q) ->
    B ! {self(),reintegra,Q},
    receive
        {_,X} -> X
    end.
