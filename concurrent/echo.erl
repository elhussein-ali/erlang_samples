-module(echo).
-export([go/0, loop/0]).

go() ->
	process_flag(trap_exit, true),

	%Pid = spawn(?MODULE, loop, []),				% fork a child process
	Pid = spawn_link(?MODULE, loop, []),			% fork a child process and catch the Exit signal from linked-processes
	%register(echoPipe, spawn(?MODULE, loop, [])),

	%echoPipe ! {self(), hello},
	Pid ! {self(), hello},
	%M = Pid ! {self(), hello},						% M will be the message itself

	Reference = erlang:monitor(process, Pid)		% monitor the process termination by sending DOWN message

	receive
		{Pid, Msg} -> io:format("~w~n",[Msg]);
		{'EXIT', _Pid, Reason} -> {error, Reason};
		{'DOWN',Reference,process,Pid,Reason} -> Reason
	after 1000 -> {error, timeout}					% timwout after milliseconds
	end,

	Pid ! stop
.

loop() ->
	receive
		{FromPid, Msg} ->
			FromPid ! {self(), Msg},
			loop();
		stop -> true
	end
.

% use receive as timer delay
sleep(T) ->
	receive
	after T -> true
	end.

%exit(Reason)			% Causes the calling process to terminate with reason Reason (normal, kill, Other).
%exit(Pid,Reason)		% Sends an exit signal to Pid.
exitApp() ->
	exit(ok)
.