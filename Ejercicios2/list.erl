-module(list).
-export([last/1]).

last([H|[]]) -> H;
last([_|T]) -> last(T).

    