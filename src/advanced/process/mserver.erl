-module(mserver).

-export([start/0, stop/0, allocate/0, deallocate/1]).
-export([init/0]).


%% These are the start functions used to create and
%% initialize the server.
start() ->
	register(mserver, spawn(?MODULE, init, [])).

init() ->
	Frequencies = {[10,11,12,13,14,15], []},
	loop(Frequencies).

%% The Internal Help Functions used to allocate and
%% deallocate frequencies.
allocate({[], Allocated}, _Pid) ->
	{{[], Allocated}, {error, no_frequency}};
allocate({[Freq|Free], Allocated}, Pid) ->
	{{Free, [{Freq, Pid}|Allocated]}, {ok, Freq}}.

deallocate({Free, Allocated}, Freq) ->
	NewAllocated=lists:keydelete(Freq, 1, Allocated),
	{[Freq|Free], NewAllocated}.

%% The Main Loop
loop(Frequencies) ->
	receive
		{request, Pid, allocate} ->
			{NewFrequencies, Reply} = allocate(Frequencies, Pid),
			reply(Pid, Reply),
			loop(NewFrequencies);
		{request, Pid , {deallocate, Freq}} ->
			NewFrequencies = deallocate(Frequencies, Freq),
			reply(Pid, ok),
			loop(NewFrequencies);
		{request, Pid, stop} ->
			reply(Pid, ok)
	end.
	
reply(Pid, Reply) ->
	Pid ! {reply, Reply}.



%% The client Functions
stop() -> call(stop).
allocate() -> call(allocate).
deallocate(Freq) -> call({deallocate, Freq}).

%% We hide all message passing and the message
%% protocol in a functional interface.
call(Message) ->
	mserver ! {request, self(), Message},
	receive
		{reply, Reply} -> Reply
	end.
