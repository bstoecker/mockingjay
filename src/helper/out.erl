-module(out).
-export([puts/2]).

puts(String, Params) ->
  erlang:display(io:format(String ++ "~n", Params)).
