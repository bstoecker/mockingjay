-module(scheduler_controller).
-export([schedule/1, create_record_list/2]).
-include("controller_helper.hrl").

schedule(Req) ->
  {_,Body} = mochijson2:decode(Req:recv_body()),
  Empl = proplists:get_value(<<"employees">>, Body, ""),
  
  Employees = employee:new_list(converter:flatten_struct_list(Empl)),
  out:puts("~nEMPLOYEES: ~p", [Employees]),
  
  % Body = get_body(Req),
  % out:puts("~nbody: ~p", [Body]),
  % EmployeeList = get_element_list(<<"employees">>, Body),
  % out:puts("~nemployee_list: ~p", [EmployeeList]),
  % Employees = create_record_list(employee, EmployeeList),
  % out:puts("~nemployees: ~p", [Employees]),









  % EmployeeList = proplists:get_value(<<"employees">>, Body, []),
  % out:puts("~nEmployees: ~p~n", [EmployeeList]),

  % Employees = get_element_list(proplists:get_value(<<"employees">>, Body)),
  % % out:puts("~nEmployees2: ~p~n", [Employees]),

  % ActivityList = jsonerl:decode(Req:recv_body()),
  % %%proplists:get_value(<<"activities">>, Body, []),
  % out:puts("~nActivities: ~p~n", [ActivityList]),

  % WorkloadList = proplists:get_value(<<"workloads">>, Body, []),
  % out:puts("~nWorkloads: ~p~n", [WorkloadList]),

  % From = get_value(<<"from">>, Body),
  % out:puts("~nFrom: ~p~n", [From]),

  % To = get_value(<<"to">>, Body),
  % out:puts("~nTo: ~p~n", [To]),

  % Interval = get_value(<<"interval">>, Body, 900),
  % out:puts("~nInterval: ~p~n", [Interval]),
  
  Req:respond(
    {
      200,
      [{"Content-Type", "application/json"}],
      mochijson2:encode({struct,[
        { employees, 42 }
        % { activities, ActivityList },
        % { workloads, WorkloadList },
        % { interval, Interval }
      ]})
    }
  ).

