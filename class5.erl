-module(class5).
-export([start/0, suma/0]).

% P = echo:start().
% P ! {self(), hola}.
% erlang:process_info(self(),messages).
% [S ! {self(),10,X} || X <- lists:seq(1,100)].
start() ->
    spawn(?MODULE, suma, []).

suma() ->
    receive
        {From, A, B} ->
            From ! (A + B)
    end,
    suma().
