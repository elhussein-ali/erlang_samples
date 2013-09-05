-module(test4).
-export([
	hello/0
]).


%% Runtime Error Handling
hello() ->
	Z = (catch 1/0),
	io:format("Z = ~w~n", [Z]),

	X=2,
	try (X=3) of
		_ -> io:format("no error ~n")
	catch
		error:Error -> {error, Error};
		%error:_ -> io:format("error occur ~n");
		_:_ -> io:format("unknown error occur ~n")
	after
		ok
	end,

	%try_return(1)
	%try_return(0)
	try_return(-1),
	try_return2(1)
.

try_return(X) when is_integer(X) ->
	try return_error(X) of
		Val -> {normal, Val}
	catch
		exit:Reason -> {exit, Reason};
		throw:Throw -> {throw, Throw};
		error:Error -> {error, Error}
	end
.

try_return2(X) when is_integer(X) ->
	try return_error(X)
	catch
		exit:Reason -> {exit, Reason};
		throw:Throw -> {throw, Throw};
		error:Error -> {error, Error}
	end
.

return_error(X) when X < 0 -> 
	throw({'EXIT', {
		badarith,[
			{exception,return_error,1},
			{erl_eval,do_apply,5},
			{shell,exprs,6},
			{shell,eval_exprs,6},
			{shell,eval_loop,3}
	]}});
return_error(X) when X == 0 -> 1/X;
return_error(X) when X > 0->
	{'EXIT', {
		badarith, [
		{exception,return_error,1},
		{erl_eval,do_apply,5},
		{shell,exprs,6},
		{shell,eval_exprs,6},
		{shell,eval_loop,3}
	]}}.