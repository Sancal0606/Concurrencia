-module(echo).
-export([start/0, loop/0]).

% P = echo:start().
% P ! {self(), hola}.
% erlang:process_info(self(),messages).

start() ->
    spawn(echo, loop, []).


loop() ->
    receive   
        {F,ping} -> 
            F ! true,
            loop();
        {F, M} ->
            F ! {M,M},
            loop()

    end.
 