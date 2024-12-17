-module(banc).
-export([start/0,do_op/1,consulta/1,ingreso/2,reintegra/2,avorta/1,esperar/0]).

start() ->
    spawn(?MODULE,do_op,[1]).

do_op(D) ->
    receive
        {From,consulta} -> 
            timer:sleep(esperar()),
            From ! D,
            term(),
            do_op(D);
        {From, ingreso, Q} ->
            timer:sleep(esperar()),
            D2 = D + Q,
            From ! D2,
            do_op(D2);
        {From, reintegra, Q} when Q =< D ->
            timer:sleep(esperar()),
            esperar(),
            D2 = D - Q,
            From ! D2,
            do_op(D2);
        {From, reintegra, _} ->
            timer:sleep(esperar()),
            From ! denegada,
            do_op(D)

    end.

esperar() -> 1000 * trunc(2 * math:pow(-math:log(1 - rand:uniform()),0.5)).

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

avorta(B)->
    B ! {self(),avorta},
    receive 
        X -> X
    end.