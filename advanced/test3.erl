-module(test3).
-export([init/0]).
-vsn(1.1).				%% help us keep track of which module version we have loaded in the runtime system

%% versioning module track

new() -> dict:new().

write(Key, Data, Db) -> dict:store(Key, Data, Db).

read(Key, Db) ->
	case dict:find(Key, Db) of
		error -> {error, instance};
		{ok, Data} -> {ok, Data}
	end
.

delete(Key, Db) -> dict:erase(Key, Db).

destroy(_Db) -> ok.


init() ->
	Db = new(),
	
	Db1 = write(francesco, san_francisco, Db),
	Db2 = write(alison, london, Db1),

	io:format(module_info()),

	read(francesco, Db2)
.