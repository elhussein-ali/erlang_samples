-module(test1).
-author('elhussein ali').
-date('August 17 2013').

-import(math, [sqrt/1]).
-export([
	hello/0
]).
%-compile(export_all).	% directive, which at compile time will export all functions defined in the module
%-compile([debug_info, export_all]).


%% Module
%% the file and module names have to be the same
%% The .beam suffix stands for "Björn’s Erlang Abstract Machine"
hello() ->
	% single line comment
	io:format("call sqrt(5) = ~f\n", [sqrt(5)]),

	io:format("call hello of module test7:hello()\n"),
	test7:hello()
.