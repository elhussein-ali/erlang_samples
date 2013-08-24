% -ifndef, -ifdef, -undef, -else, -endif, -define

-ifdef(debug).
	-define(DBG(Str, Args), io:format(Str, Args)).
-else.
	-define(DBG(Str, Args), ok).
-endif.