-module(hello).
-compile(export_all).

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