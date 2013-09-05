-module(m1_test).

-include_lib("eunit/include/eunit.hrl").


%% run via calling "m1_test:test()."

foo_test() ->
	?assertEqual(2, m1:foo(1, 19)),
	?assertEqual(20, m1:foo(1, 19)).

%% group test
foo_test_() ->
	[
		?_assertEqual(5, m1:foo(1, 19)),
		?_assert(2 > m1:foo(1, 19)),
		?_assert(20 < m1:foo(1, 19))
	].