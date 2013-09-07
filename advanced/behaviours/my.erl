-module(my).

-behaviour(exa_server).
 
-export([init/1, handle/1, sync/2, foo/0]).
 
init(Config) ->
    Config.

sync(_Entry, Config) ->
    Config.
 
handle(Message) ->
    Message.
 
foo() ->
    foo_atom_returned.