-module(ex5).
-export([fact/1,taylor/1,list_cos/1,random_angles/1,cos_angles/0,divide/2,divide_in/2,pros/0,getAt/2,start_cos/0,cos_asyn/0,time_pros/0]).

length_list([]) ->
    0;
length_list([_|T])->
    1 + length_list(T).

fact(1)->
    1;
fact(N) ->
    N * fact(N - 1).

taylor(N) ->
    taylor(10,N).
taylor(0,_) -> 
    1;
taylor(N,X) ->
 ( math:pow(-1,N) * (math:pow(X,2*N) / fact(2 * N))) + taylor(N - 1,X).

list_cos([H|[]]) ->
    [taylor(H)];
list_cos([H|T]) ->
    [taylor(H)|list_cos(T)].

random_angles(N) ->
    [rand:uniform() * math:pi() /2 || _ <- lists:seq(1,N) ].

cos_angles()->
    L = random_angles(80),
    timer:tc(ex5, list_cos, [L]).

divide([],_)->
    [];
divide(L,N) ->
    case length_list(L) >= N of
    true ->
        {Lf,R} = lists:split(N,L),
        [Lf|divide(R,N)];
    false -> 
        [L]
    end.

divide_in(L,K) ->
    divide(L,length_list(L) div K).

start_cos()->
    spawn(ex5,cos_asyn,[]).

cos_asyn() ->
    receive
        {F,L} ->
            F ! list_cos(L),
            cos_asyn()
    end.

getAt([H|_],0)->
    H;
getAt([_|T],N)->
    getAt(T,N-1).

get_second({_,E})->
    E.

pros()->
    L = random_angles(80),
    R = divide_in(L,4),
    Lb = [start_cos()||_<-lists:seq(1,4)],
    [get_second(getAt(Lb,I) ! {self(),getAt(R,I)})||I <- lists:seq(0,3)].


time_pros() ->
     timer:tc(ex5, pros, []).