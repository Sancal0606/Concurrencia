-module(banc).
-export([start/0,do_op/1,consulta/1,ingreso/2,reintegra/2]).

start() ->
    spawn(?MODULE,do_op,[1]).

do_op(D) ->
    receive
        {From,consulta} -> 
            timer:sleep(700),
            From ! D,
            do_op(D);
        {From, ingreso, Q} ->
            timer:sleep(700),
            D2 = D + Q,
            From ! D2,
            do_op(D2);
        {From, reintegra, Q} when Q =< D ->
            timer:sleep(700),
            D2 = D - Q,
            From ! D2,
            do_op(D2);
        {From, reintegra, _} ->
            timer:sleep(700),
            From ! denegada,
            do_op(D)
    end.

consulta(B) ->
    B ! {self(),consulta},
    receive
        X -> X
    end.

ingreso(B,Q) ->
    B ! {self(),ingreso,Q},
    receive
        X -> X
    end.

reintegra(B,Q) ->
    B ! {self(),reintegra,Q},
    receive
        X -> X
    end.