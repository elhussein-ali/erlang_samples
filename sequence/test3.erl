-module(test3).
-export([
	hello/0
]).


%% BIFs (built-in functions)
hello() ->
	% hd, tl, length, tuple_size, element, setelement, erlang:append_element
	List = [one,two,three,four,five],
	Tuple = {1,2,3,4,5},

	io:format("hd(List) = ~w\n", [hd(List)]),
	io:format("tl(List) = ~w\n", [tl(List)]),
	io:format("length(List) = ~w\n", [length(List)]),
	io:format("tuple_size(Tuple) = ~w\n", [tuple_size(Tuple)]),
	io:format("element(2, Tuple) = ~w\n", [element(2, Tuple)]),
	io:format("setelement(3, Tuple, three) = ~w\n", [setelement(3, Tuple, three)]),
	io:format("erlang:append_element(Tuple, 6) = ~w\n", [erlang:append_element(Tuple, 6)]),


	% Type Conversion
	%  atom_to_list/1, list_to_atom/1, list_to_existing_atom/1,
	%  list_to_tuple/1, tuple_to_list/1
	%  float/1, list_to_float/1
	%  float_to_list/1, integer_to_list/1
	%  round/1, trunc/1, list_to_integer/1
	io:format("float(12) = ~w\n", [float(12)]),
	io:format("round(12.5) = ~w\n", [round(12.5)]),
	io:format("trunc(12.5) = ~w\n", [trunc(12.5)]),

	% apply(Module, Function, Arguments)
	%apply(test2, hello, [3]),

	% io functions
	io:get_line("gissa line>"),
	io:get_chars("tell me> ",2),
	%io:read("ok, then>>")

	% io format
	%  ~c An ASCII code to be printed as a character.
	%  ~f A float to be printed with six decimal places.
	%  ~e A float to be printed in scientific notation, showing six digits in all.
	%  ~w Writes any term in standard syntax.
	%  ~p Writes data as ~w, but in "pretty printing" mode
	%  ~W, ~P Behave as ~w, ~p, but eliding structure at a depth of 3. These take an extra argument
	%  ~B Shows an integer to base 10.
	% The full control sequence has the form ~F.P.PadC, where
	%  F is the field width of the printed argument,
	%  P is its precision,
	%  Pad is the padding character,
	%  and C is the control character.
	%
	io:format("the sum of ~W is ~.2f ~n", [[2,3|3.141],3, 8.141]),


	% The client sent a request to allocate a frequency and waited for a response of the format {reply, Reply}. How can
	% you be sure this message actually originates from the frequency server
	%
	%	call(Message) ->
	%		Ref = make_ref(),
	%		frequency ! {request, {Ref, self()}, Message},
	%		receive
	%			{reply, Ref, Reply} -> Reply
	%		end.
	%	
	%	reply({Ref, Pid}, Message) ->
	%		Pid ! {reply, Ref, Message}
	%
	io:format("make_ref() = ~w~n", [make_ref()]),
	io:format("make_ref() = ~w~n", [make_ref()])
.