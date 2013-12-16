-module(scheduler_controller).
-export([schedule/1]).
-include("controller_helper.hrl").

schedule(Req) ->
  Req:respond(
    {
      200,
      [{"Content-Type", "application/json"}],
      mochijson2:encode({struct,[{message, <<"hula">>}]})
    }
  ).