-module(test1).
-author('elhussein ali').
-date('August 17 2013').
-export([
	hello/0
]).


%% case statement
hello() ->
	A = case lists:member(foo, [1, foo, 3]) of
		true -> ok;
		false -> {error, unknown_element}
	end,

	io:format("A = ~w\n", [A]),
	io:format("convert(wednesday) = ~w\n", [convert(wednesday)]),
	io:format("convert(xx) = ~w\n", [convert(xx)]),
	io:format("listlen([11,22,33,44]) = ~w\n", [listlen([11,22,33,44])]),
	io:format("index(2, [11,22,33,44]) = ~w\n", [index(2, [11,22,33,44])]),
	io:format("safe(4) = ~w\n", [safe(4)]),
	io:format("safe2(4) = ~w\n", [safe2(4)])
.

convert(Day) ->
	case Day of
		monday -> 1;
		tuesday -> 2;
		wednesday -> 3;
		thursday -> 4;
		friday -> 5;
		saturday -> 6;
		sunday -> 7;
		_ -> {error, unknown_day}
	end
.

listlen(Y) ->
	case Y of
		[] -> 0;
		[_|Xs] -> 1 + listlen(Xs)
	end
.

index(X,Y) -> index({X,Y}).
index(Z) ->
	case Z of
		{0,[X|_]} -> X;
		{N,[_|Xs]} when N>0 -> index(N-1,Xs)
	end
.

safe(X) ->
	case X of
		one -> Y = 12;
		_ -> Y = 196
	end,

	X+Y
.

safe2(X) ->
	(case X of
		one -> 12;
		_ -> 196
	end) + X
.