-module(echo).
-export([start/0,loop/0]).

start() ->
    spawn(echo,loop,[]).

loop() -> 
    receive
        {F,ping} ->
            F ! true,
            loop();
        {F, M} ->
            F ! M,
            loop()
    end.
        