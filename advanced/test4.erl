-module(test4).
-export([hello/0]).

%% Binary data

hello() ->
	% serialize data to binary
	Bin1 = term_to_binary({test,12,true,[1,2,3]}),
	io:format("Bin1 = ~w~n", [Bin1]),

	% deserialize
	Term1 = binary_to_term(Bin1),
	io:format("Term1 = ~w~n", [Term1]),

	io:format("is_binary(Bin1) = ~w~n", [is_binary(Bin1)]),
	io:format("is_binary(Term1) = ~w~n", [is_binary(Term1)]),


	% list_to_binary, 
	Bin2 = <<1,2,3>>,
	L2 = binary_to_list(Bin2),
	io:format("L2 = ~w~n", [L2]),

	<<E,F,G>> = Bin2,
	io:format("F = ~w~n", [F]),

	% Expr:Size/Type
	%  The default size of an integer is 8, and of a float 64
	%  The valid types are integer, float, binary, byte, bits, and bitstring
	io:format("<<5:4, 5:4>> = ~w~n", [<<5:4, 5:4>>]),

	<<Int1:2, Int2:6>> = <<128>>,
	io:format("Int1 = ~w~n", [Int1]),
	io:format("Int2 = ~w~n", [Int2]),

	% Bitstring Comprehensions
	io:format("<< <<bnot(X):1>> || <<X:1>> <= <<42:6>> >> = ~w~n", 
		[<< <<bnot(X):1>> || <<X:1>> <= <<42:6>> >>]),


	% binary operators
	%  band, bor, bnot, bxor,
	%  bsl ---> is shift left
	%  bsr ---> is shift right
	io:format("9 band 17 = ~w~n", [9 band 17])
.