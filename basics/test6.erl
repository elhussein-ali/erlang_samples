-module(test6).
-export([
	hello/0
]).

%% variables
%% variable start with an uppercase letter, 
%% variable can also begin with an underscore in pattern match (unbind variable)
%% once you’ve bound a variable, you cannot change its value this is called "single assignment"
%% all calls with variables in Erlang are call "by value", The concept of call "by reference" does not exist
hello() -> 
	Persons = [
		{person,"Joe","Armstrong", [
			{shoeSize, 42},
			{pets, [{cat,zorro},{cat,daisy}]},
			{children, [{thomas,21},{claire,17}]}
		]},

		{person,"Mike","Williams", [
			{shoeSize, 41},
			{likes, [boats,wine]}
		]}
	],

	io:format("Persons = ~w\n", [Persons]),

	%% pattern matching
	{A1, A2} = {1,3},
	io:format("A1 = ~p\n", [A1]),
	io:format("A2 = ~p\n", [A2]),

	{B1, B2, _} = {11,33,6},
	io:format("B1 = ~p\n", [B1]),
	io:format("B2 = ~p\n", [B2]),

	{C1, _, [C2|_]} = {abc, 23, [22, 23]},
	io:format("C1 = ~p\n", [C1]),
	io:format("C2 = ~p\n", [C2])
.