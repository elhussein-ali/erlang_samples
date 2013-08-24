-module(test2).
-author('elhussein ali').
-date('August 17 2013').

-export([
	init/0
]).

-include("include/def.hrl").

-define(TIMEOUT, 1000).		% constant like #define in c
-define(FUNC, X).
-define(TION, +X).
-define(Multiple(X,Y), X rem Y == 0).
-define(VALUE(Call), ?DBG("~p = ~p~n",[??Call,Call])).


%% Macro this is preprocessor directives
init() ->
	code:add_patha("./"),	%% add directory path for libraries

	%debugger:start(),

	% built in macros
	?DBG("~w~n", [?MODULE]),
	?DBG("~s~n", [?MODULE_STRING]),
	?DBG("~s~n", [?FILE]),
	?DBG("~w~n", [?LINE]),
	?DBG("~w~n", [?MACHINE]),

	?DBG("~w~n", [?TIMEOUT]),
	?DBG("~w~n", [double(3)]),

	test1()
.

double(X) -> ?FUNC?TION.

test1() -> ?VALUE(length([1,2,3])).