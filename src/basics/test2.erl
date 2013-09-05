-module(test2).
-export([
	hello/0
]).

%% Float
hello() -> 
	io:format("ErLang\n"),
	io:format("hello world\n"),

	io:format("A = ~f\n", [17.368]),
	io:format("A = ~f\n", [-56.654]),
	io:format("A = ~f\n", [1.234E-10])				%% 1.234 × 10^−10 = 0.0000000001234
	.