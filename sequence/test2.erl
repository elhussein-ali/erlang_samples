-module(test2).
-author('elhussein ali').
-date('August 17 2013').
-export([
	hello/1
]).


%% if statement
%% when guard expression
hello(X) ->
	if
		X > 1 -> A = 12;
		X == 1 -> A = 11;
		true -> A = X
	end,

	B = if
		X > 1 -> 12;
		X == 1 -> 11;
		true -> X
	end,

	io:format("A = ~w\n", [A]),
	io:format("B = ~w\n", [B]),

	io:format("even(11) = ~w\n", [even(11)]),
	io:format("even(12) = ~w\n", [even(12)]),

	io:format("number(12) = ~w\n", [number(12)]),
	io:format("number(12.2) = ~w\n", [number(12.2)]),
	io:format("number({}) = ~w\n", [number({})]),

	io:format("bump([1,2,3,4,5,6]) = ~w\n", [bump([1,2,3,4,5,6])]),
	io:format("evenlist([1,2,3,4,5,6]) = ~w\n", [evenlist([1,2,3,4,5,6])]),
	io:format("member(3, [1,2,3,4,5,6]) = ~w\n", [member(3, [1,2,3,4,5,6])]),
	io:format("member(13, [1,2,3,4,5,6]) = ~w\n", [member(13, [1,2,3,4,5,6])])
.

even(Int) when Int rem 2 == 0 -> true;
even(Int) when Int rem 2 == 1 -> false.

evenlist([]) -> [];
evenlist([Head | Tail]) when Head rem 2 == 0 -> [Head | evenlist(Tail)];
evenlist([_ | Tail]) -> evenlist(Tail).

number(Num) when is_integer(Num) -> integer;
number(Num) when is_float(Num) -> float;
number(_) -> false.

bump([]) -> [];
bump([Head | Tail]) -> [Head + 1 | bump(Tail)].

member(_, []) -> false;
member(H, [H | _]) -> true;
member(H, [_ | T]) -> member(H, T).