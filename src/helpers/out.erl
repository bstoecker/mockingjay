-module(out).
-export([puts/1, puts/2]).

puts(String) -> puts(String, []).

puts(String, Params) -> erlang:display(io:format(String ++ "~n", Params)).
