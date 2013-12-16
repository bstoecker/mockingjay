%% @author Mochi Media <dev@mochimedia.com>
%% @copyright 2010 Mochi Media <dev@mochimedia.com>

%% @doc mockingjay.

-module(mockingjay).
-author("Mochi Media <dev@mochimedia.com>").
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.


%% @spec start() -> ok
%% @doc Start the mockingjay server.
start() ->
    mockingjay_deps:ensure(),
    ensure_started(crypto),
    application:start(mockingjay).


%% @spec stop() -> ok
%% @doc Stop the mockingjay server.
stop() ->
    application:stop(mockingjay).
