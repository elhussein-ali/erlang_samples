-module(test4).
-export([
	hello/0
]).

%% Tuple
%% tuple, when the first element is an atom, it is called a tag (tagged tuple)
hello() -> 
	io:format("ErLang Tuple\n"),

	T = {
		person,
		{name, 'elhussein'},
		{age, 35}
	},

	io:format("T = ~w\n", [T]),
	io:format("tuple_size(T) = ~w\n", [tuple_size(T)]),
	io:format("element(2, T) = ~w\n", [element(2, T)]),

	T2 = setelement(2, T, {name, 'elhussein ali'}),

	io:format("T = ~w\n", [T]),
	io:format("T2 = ~w\n", [T2])
	.