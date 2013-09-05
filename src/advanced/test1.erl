%% @author Francesco Cesarini <support@erlang-consulting.com>
%% @doc Back end for the mobile subscriber database.
%%  The module provides an example of using ETS and DETS tables.
%% @copyright 2009 Francesco Cesarini and Simon Thompson

-module(test1).
-author('elhussein ali').
-date('August 17 2013').
-export([
	hello/0
]).

% Erlang Type Notation
%  any(), atom(), binary(), boolean(), byte(), char(), deep_string(), float(), function(),
%  integer(), list(T), nil(), none(), number(), pid(), port(), reference(), string(), tuple()
-type(plan() :: prepay | postpay).
-type(status() :: enabled | disabled).
-type(service() :: atom()).

-record(name, {first, surname}).
-record(person, {name,age=0,phone=""}).

-record(usr, {
	msisdn 				::integer(),
	id 					::integer(),
	status = enabled 	::status(),
	plan 				::plan(),
	services = [] 		::[service()]
}).

-spec(add_usr(#usr{}) -> ok).
%-spec(create_tables(string()) -> {ok, ref()} | {error, atom()}).
-spec(create_tables(FileName::string()) -> {ok} | {error, atom()}).
-spec(delete_usr(_) -> any()).
-spec(update_usr([tuple()] | tuple()) -> 'ok').


%% Records (like structure in c) this is preprocessor directives
%% the record name and its fields is atom
%% it is possible to give default values for the fields in the record definition
hello() ->
	io:format("~w~n", [record_info(size, person)]),
	io:format("~w~n", [record_info(fields, person)]),

	Person = #person{name = #name{first = "Robert", surname = "Virding"}},
	VIP = birthday(Person),

	showPerson(Person),
	showPerson(VIP),

	io:format("create_tables(\"ffff1\") = ~w~n", [create_tables("ffff1")])
.


birthday(#person{age=Age} = P) -> P#person{age=Age+1}.

showPerson(#person{} = P) -> io:format("name: ~s age: ~w phone: ~s~n", [(P#person.name)#name.first, P#person.age, P#person.phone]).

create_tables(FileName) -> {FileName, done}.

add_usr(#usr{} = u) -> u.

delete_usr(M) -> M.

update_usr(T) -> T.