-module(test1).
-export([
	hello/0
]).

%% Integer
hello() -> 
	io:format("ErLang\n"),
	io:format("hello world\n"),

	io:format("A = ~p\n", [20]),
	io:format("A = ~p\n", [2#101001]),
	io:format("A = ~p\n", [-16#A9E]),
	io:format("A = ~p\n", [$Z])				% ascii for Z character
	.