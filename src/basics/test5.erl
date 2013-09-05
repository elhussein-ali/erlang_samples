-module(test5).
-export([
	hello/0
]).

%% List
hello() -> 
	io:format("ErLang List\n"),

	%% strings is a special kind of list
	io:format("[65,66,67] = ~s\n", [[65,66,67]]),

	%% list of tagged tuples
	L = [
		{person, 'Joe', 'Armstrong'},
		{person, 'Robert', 'Virding'},
		{person, 'Mike', 'Williams'}
	],

	io:format("L = ~w\n", [L]),
	io:format("[{person, 'soso', 'Mohamed'}|L] = ~w\n", [[{person, 'soso', 'Mohamed'}|L]]),
	io:format("[1,2,3] ++ [4,5,6] = ~w\n", [[1,2,3] ++ [4,5,6]]),
	io:format("[1,2,2,3,4,4] -- [2,4] = ~w\n", [[1,2,2,3,4,4] -- [2,4]]),
	io:format("length([1,2,3]) = ~w\n", [length([1,2,3])]),

	io:format("lists:max([1,2,3]) = ~w\n", [lists:max([1,2,3])]),
	io:format("lists:min([1,2,3]) = ~w\n", [lists:min([1,2,3])]),
	io:format("lists:sum([3,4,10,7,9]) = ~w\n", [lists:sum([3,4,10,7,9])]),
	io:format("lists:reverse([1,2,3]) = ~w\n", [lists:reverse([1,2,3])]),
	io:format("lists:sort([2,1,3]) = ~w\n", [lists:sort([2,1,3])]),
	io:format("lists:split(2,[3,4,10,7,9]) = ~w\n", [lists:split(2,[3,4,10,7,9])]),
	io:format("lists:zip([1,2,3],[5,6,7]) = ~w\n", [lists:zip([1,2,3],[5,6,7])]),
	io:format("lists:delete(2,[1,2,3,2,4,2]) = ~w\n", [lists:delete(2,[1,2,3,2,4,2])]),
	io:format("lists:last([1,2,3]) = ~w\n", [lists:last([1,2,3])]),
	io:format("lists:member(5,[1,24]) = ~w\n", [lists:member(5,[1,24])]),
	io:format("lists:member(24,[1,24]) = ~w\n", [lists:member(24,[1,24])]),
	io:format("lists:nth(2,[3,4,10,7,9]) = ~w\n", [lists:nth(2,[3,4,10,7,9])]),

	[A|B] = L,
	io:format("A = ~w\n", [A]),
	io:format("B = ~w\n", [B]),

	io:format("hd(L) = ~w\n", [hd(L)]),		% Returns the first element of a list
	io:format("tl(L) = ~w\n", [tl(L)]),		% Returns the remaining elements when the first element has been removed

	% list comprehension
	io:format("[2*N || N <- [1,2,3,4]] = ~p~n", [[2*N || N <- [1,2,3,4]]]),
	io:format("[X || X <- [1,2,3,4,5,6,7,8,9,10], X rem 2 =:= 0] = ~p~n", [[X || X <- [1,2,3,4,5,6,7,8,9,10], X rem 2 =:= 0]]),

	RestaurantMenu = [{steak, 5.99}, {beer, 3.99}, {poutine, 3.50}, {kitten, 20.99}, {water, 0.00}],
	RestaurantMenu2 = [{Item, Price*1.07} || {Item, Price} <- RestaurantMenu, Price >= 3, Price =< 10],
	io:format("RestaurantMenu2 = ~w\n", [RestaurantMenu2]),

	io:format("[X+Y || X <- [1,2], Y <- [2,3]] = ~w\n", [[X+Y || X <- [1,2], Y <- [2,3]]]),
	io:format("[ {X,Y} || X <- lists:seq(1,4), X rem 2 == 0, Y <- lists:seq(X,4), X+Y>4 ] = ~w~n", 
		[[ {X,Y} || X <- lists:seq(1,4), X rem 2 == 0, Y <- lists:seq(X,4), X+Y>4 ]]),

	Weather = [{toronto, rain}, {montreal, storms}, {london, fog}, {paris, sun}, {boston, fog}, {vancouver, snow}],
	FoggyPlaces = [X || {X, fog} <- Weather],
	io:format("FoggyPlaces = ~w\n", [FoggyPlaces])
.