-module(echo2).
-export([start/0,loop/0]).

start() ->
    spawn(echo,loop,[]).

loop() ->
    receive
        {F,ping} ->
            F ! true,
            loop();
        {F,M} ->
            F ! {M,M},
            loop()
    end.