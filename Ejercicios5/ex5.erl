-module(ex5).
-export([fact/1,taylor/1]).

fact(1.0)->
    1;
fact(N) ->
    N * fact(N - 1).

taylor(N) ->
    taylor(N,N).
taylor(0,_) -> 
    1;
taylor(N,X) ->
   io:format("The value is: ~p.", [N]),
 ( math:pow(-1,N) * (math:pow(X,2*N) / fact(2 * N))).
