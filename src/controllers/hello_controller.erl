-module(hello_controller).
-export([get_hello/1]).

get_hello(Req) ->
  QueryStringData = Req:parse_qs(),
  Username = proplists:get_value("username", QueryStringData, "Anonymous"),
  Req:respond(
    {
      200,
      [{"Content-Type", "text/plain"}],
      "Hello " ++ Username ++ "!\n"
    }
  ).