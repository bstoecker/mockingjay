%% @author Mochi Media <dev@mochimedia.com>
%% @copyright mockingjay Mochi Media <dev@mochimedia.com>

%% @doc Callbacks for the mockingjay application.

-module(mockingjay_app).
-author("Mochi Media <dev@mochimedia.com>").

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for mockingjay.
start(_Type, _StartArgs) ->
    mockingjay_deps:ensure(),
    mockingjay_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for mockingjay.
stop(_State) ->
    ok.
