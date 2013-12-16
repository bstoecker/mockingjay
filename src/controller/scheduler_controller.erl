-module(scheduler_controller).
-export([schedule/1]).
-include("controller_helper.hrl").

schedule(Req) ->
  Data = Req:recv_body(),
  {struct, Body} = mochijson2:decode(Data),

  EmployeeList = get_value(<<"employees">>, Body, []),
  ActivityList = get_value(<<"activities">>, Body, []),
  WorkloadList = get_value(<<"workloads">>, Body, []),
  From = get_value(<<"from">>, Body),
  To = get_value(<<"to">>, Body),
  Interval = get_value(<<"interval">>, Body, 900),

  Req:respond(
    {
      200,
      [{"Content-Type", "application/json"}],
      mochijson2:encode({struct,[
        { employees, EmployeeList },
        { activities, ActivityList },
        { workloads, WorkloadList },
        { interval, Interval }
      ]})
    }
  ).

  % createLists(Result, []) ->
  %   puts("~nList: ~p~n", [Result]),
  %   Result;
  % createLists(Result, [{struct, First}|Sublist]) ->
  %   puts("~nElement: ~p~n", [First]),
  %   createLists([createLists(element(2,First))|Result], Sublist).

  % createLists(PList) ->
  %   createLists([], PList).