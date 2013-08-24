-module(test7).
-export([
	hello/0,
	%%area/0, area/1,
	factorial/1
]).

%% Functions
%% the name of function is atom
%% the number of parameters in a function is called its arity
hello() ->
	io:format("area({square, 10}) = ~p\n", [area({square, 10})]),
	io:format("area({circle, 10}) = ~f\n", [area({circle, 10})]),
	io:format("area() = ~w\n", [area()]),
	io:format("factorial(5) = ~w\n", [factorial(5)]),
	io:format("index(2, [1,3,5,6,7,9]) = ~w\n", [index(2, [1,3,5,6,7,9])]),
	io:format("second([1,3,5,6,7,9]) = ~w\n", [second([1,3,5,6,7,9])]),
	valid_time({{2011,09,06},{09,04,43}}),
	io:format("add(fun one/0, fun two/0) = ~w\n", [add(fun one/0, fun two/0)]),

	% Anonymous functions
	Fn = fun() -> a end,
	io:format("Fn() = ~w\n", [Fn()]),

	Fn2 = 
		fun ([]) -> null;
			([X|_]) -> X
		end,
	io:format("Fn2([1,2,3,4]) = ~w\n", [Fn2([1,2,3,4])]),

	io:format("(times(3))(4) = ~w\n", [(times(3))(4)]),

	(fun(X) -> io:format("Anonymous = ~w~n", [X]) end)(121),

	[S|Fn3] = (next(2))(),
	io:format("S = ~w\n", [S]),
	io:format("Fn3 = ~w\n", [Fn3]),

	io:format("qsort([3,4,1,2,6,5,9,7,8]) = ~w\n", [qsort([3,4,1,2,6,5,9,7,8])])
.

area() ->
	{error, invalid_object}
.

area({square, Side}) ->
	Side * Side;
area({circle, Radius}) ->
	math:pi() * Radius * Radius;
area({triangle, A, B, C}) ->
	S = (A + B + C)/2,
	math:sqrt(S*(S-A)*(S-B)*(S-C))
.

factorial(0) -> 1;
factorial(N) ->
	N * factorial(N-1).

index(0,[X|_]) -> X;
index(N,[_|Xs]) when N>0 -> index(N-1,Xs).

right_age(X) when X >= 16, X =< 104 -> true;	% The comma (,) acts in a similar manner to the operator andalso
right_age(_) -> false.

wrong_age(X) when X < 16; X > 104 -> true;		% the semicolon (;) acts a bit like orelse
wrong_age(_) -> false.

second([_,X|_]) -> X.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
	io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n",[Date,Y,M,D]),
	io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S])
.

one() -> 1.
two() -> 2.
add(X,Y) -> X() + Y().

% function return function
times(X) ->
	fun (Y) -> X*Y end
.

next(Seq) -> fun() -> [Seq|next(Seq+1)] end.

% list comperhension in function
qsort([]) -> [];
qsort([X|Xs]) ->
	qsort([Y || Y<-Xs, Y =< X]) ++ [X] ++ qsort([Y || Y<-Xs, Y > X])
.