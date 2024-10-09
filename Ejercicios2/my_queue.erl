-module(my_queue).
-export([buida/0,encua/2,desencua/1,isBuida/1]).

buida() -> {[],[]}.

encua(E,{A,Ai}) ->
    {[E|A],Ai}.

desencua({[_|T],[]}) ->
    {[],class3:rev(T)};
desencua({A,[_|T]}) ->
    {A,T}.

isBuida({[],[]}) -> true;
isBuida({_,_}) -> false.
    