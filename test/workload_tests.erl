-module(workload_tests).
-include_lib("eunit/include/eunit.hrl").

new_test() ->
  ReqArgs = [
    {
      struct,
      [{<<"time_stamp">>,<<"2012-01-01T00:00:00.000+01:00">>},{<<"value">>,42}]
    }
  ],
  Args = [{id,1},{interval,1800},{employee_requirements, ReqArgs}],
  Requirement = employee_requirement:new_list(
    converter:flatten_struct_list(ReqArgs)
  ),
  Workload = workload:new(Args),
  ?assertEqual(1, workload:get(Workload, id)),
  ?assertEqual(Requirement, workload:get(Workload, employee_requirements)),
  ?assertEqual(1800, workload:get(Workload, interval)).

new_list_test() ->
  ReqArgs1 = [
    {
      struct,
      [{<<"time_stamp">>,<<"2012-01-01T00:00:00.000+01:00">>},{<<"value">>,42}]
    }
  ],
  ReqArgs2 = [
    {
      struct,
      [{<<"time_stamp">>,<<"2012-01-02T00:00:00.000+01:00">>},{<<"value">>,43}]
    }
  ],
  Requirement1 = employee_requirement:new_list(
    converter:flatten_struct_list(ReqArgs1)
  ),
  Requirement2 = employee_requirement:new_list(
    converter:flatten_struct_list(ReqArgs2)
  ),
  Args = [
    [{id,1},{interval,1800},{employee_requirements,ReqArgs1}],
    [{id,2},{interval,900},{employee_requirements,ReqArgs2}]
  ],
  [Workload1, Workload2] = workload:new_list(Args),
  ?assertEqual(1, workload:get(Workload1, id)),
  ?assertEqual(1800, workload:get(Workload1, interval)),
  ?assertEqual(
    Requirement1, workload:get(Workload1, employee_requirements)
  ),
  ?assertEqual(2, workload:get(Workload2, id)),
  ?assertEqual(900, workload:get(Workload2, interval)),
  ?assertEqual(
    Requirement2, workload:get(Workload2, employee_requirements)
  ).

to_struct_list_test() ->
  ReqArgs1 = [
    {<<"time_stamp">>,<<"2012-01-01T00:00:00.000+01:00">>},{<<"value">>,42}
  ],
  ReqArgs2 = [
    {<<"time_stamp">>,<<"2012-01-02T00:00:00.000+01:00">>},{<<"value">>,43}
  ],
  Args = [
    [{id,1},{interval,1800},{employee_requirements,[{struct,ReqArgs1}]}],
    [{id,2},{interval,900},{employee_requirements,[{struct,ReqArgs2}]}]
  ],
  WorkloadList = workload:new_list(Args),
  Converted = workload:to_struct_list(WorkloadList),
  ?assertEqual(length(Converted), 2).
