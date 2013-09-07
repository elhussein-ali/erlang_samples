-module(exa_server).

-export([behaviour_info/1]).
 
behaviour_info(callbacks) ->
    [{init,1},
     {handle, 1},
     {sync, 2}];
behaviour_info(_) ->
    undefined.