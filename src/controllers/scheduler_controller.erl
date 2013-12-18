-module(scheduler_controller).
-export([schedule/1]).

schedule(Req) ->
  {_,Body} = mochijson2:decode(Req:recv_body()),

  Empl = proplists:get_value(<<"employees">>, Body, ""),
  Employees = employee:new_list(converter:flatten_struct_list(Empl)),
  
  Act = proplists:get_value(<<"activities">>, Body, ""),
  Activities = activity:new_list(converter:flatten_struct_list(Act)),

  WL = proplists:get_value(<<"workloads">>, Body, ""),
  Workloads = workload:new_list(converter:flatten_struct_list(WL)),

  Req:respond(
    {
      200,
      [{"Content-Type", "application/json"}],
      mochijson2:encode({struct,[
        { employees, employee:to_struct_list(Employees) },
        { activities, activity:to_struct_list(Activities) },
        { workloads, workload:to_struct_list(Workloads) }
      ]})
    }
  ).

