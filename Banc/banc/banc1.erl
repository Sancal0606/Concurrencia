-module(banc1).
-export([start/1, do_op/2, consulta/1, ingressa/2, reintegra/2,add_delay/0]).

start(Idb) -> spawn(?MODULE, do_op, [0,Idb]).

do_op(D,Idb) ->
    receive
		{From, consulta} ->
			Delay = add_delay(),
			if Delay > 5 ->
				term();
			true ->
				do_op(D,Idb)
			
		
    end.

add_delay() ->
    trunc(2*(math:pow((-math:log(rand:uniform())),0.5))).
esperar() -> trunc(2 * math:pow(-math:log(1 - rand:uniform()),0.5)).

consulta(B) ->
    B ! {self(), consulta},
    receive {_,D} -> D end.

reintegra(B,Q) ->
    B ! {self(), reintegra, Q},
    receive {_,D} -> D end.

ingressa(B,Q) ->
    B ! {self(), ingressa, Q},
    receive {_,D} -> D end.
