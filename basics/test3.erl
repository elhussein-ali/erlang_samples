-module(test3).
-export([
	hello/0
]).

%% operators
%% atom start with lowercase letter or delimited with single quote
%% built-in functions, usually called BIFs in the Erlang community
hello() -> 
	A = 11,

	io:format("A + A = ~p\n", [A+A]),
	io:format("A - 2 = ~p\n", [A-2]),
	io:format("A * A = ~p\n", [A*A]),
	io:format("A / A = ~f\n", [A/A]),
	io:format("A div 2 = ~p\n", [A div 2]),
	io:format("A rem 2 = ~p\n", [A rem 2]),
	io:format("(A+1)*2 = ~p\n", [(A+1)*2]),

	io:format("(A > 1) = ~w\n", [(A > 1)]),
	io:format("(A < 1) = ~w\n", [(A < 1)]),
	io:format("(A == 1) = ~w\n", [(A == 1)]),
	io:format("(A =:= 1) = ~w\n", [(A =:= 1)]),		% =:= Exactly equal to
	io:format("(A /= 1) = ~w\n", [(A /= 1)]),		% /=  not equal
	io:format("(A =/= 1) = ~w\n", [(A =/= 1)]),		% =/= Exactly not equal

	io:format("is_boolean(A < 1) = ~w\n", [is_boolean(A < 1)]),

	io:format("(A > 1) and (A == 1) = ~w\n", [(A > 1) and (A == 1)]),				% Returns true only if both arguments are true
	io:format("(A > 1) andalso (A == 1) = ~w\n", [(A > 1) andalso (A == 1)]),		% Shortcut evaluation of and: returns false if the first argument is false, without evaluating the second
	io:format("(A > 1) or (A == 1) = ~w\n", [(A > 1) or (A == 1)]),					% Returns true if either of the arguments is true
	io:format("(A > 1) orelse (A == 1) = ~w\n", [(A > 1) orelse (A == 1)]),			% Shortcut evaluation of or: returns true if the first argument is true, without evaluating the second
	io:format("(A == 1) or (A > 1) = ~w\n", [(A == 1) or (A > 1)]),
	io:format("(A == 1) orelse (A > 1) = ~w\n", [(A == 1) orelse (A > 1)]),
	io:format("(A > 1) xor (A == 1) = ~w\n", [(A > 1) xor (A == 1)]),				% “Exclusive or”: returns true if one of its arguments is true and the other false
	io:format("(A > 1) xor (A =: 1) = ~w\n", [(A > 1) xor (A /= 1)]),
	io:format("not(A > 1) = ~w\n", [not(A > 1)])
	.