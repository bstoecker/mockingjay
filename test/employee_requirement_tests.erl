-module(employee_requirement_tests).
-include_lib("eunit/include/eunit.hrl").

new_test() ->
  Args = [{time_stamp, <<"2012-01-06T00:00:00.000+01:00">>},{value, 42}],
  Requirement = employee_requirement:new(Args),
  ?assertEqual(42, employee_requirement:get(Requirement, value)),
  ?assertEqual(
    <<"2012-01-06T00:00:00.000+01:00">>,
    employee_requirement:get(Requirement, time_stamp)
  ).

new_list_test() ->
  Args = [
    [{time_stamp, <<"2012-01-06T00:00:00.000+01:00">>},{value, 42}],
    [{time_stamp, <<"2012-01-07T00:00:00.000+01:00">>},{value, 43}]
  ],
  [Requirement1, Requirement2] = employee_requirement:new_list(Args),
  ?assertEqual(42, employee_requirement:get(Requirement1, value)),
  ?assertEqual(
    <<"2012-01-06T00:00:00.000+01:00">>,
    employee_requirement:get(Requirement1, time_stamp)
  ),
  ?assertEqual(43, employee_requirement:get(Requirement2, value)),
  ?assertEqual(
    <<"2012-01-07T00:00:00.000+01:00">>,
    employee_requirement:get(Requirement2, time_stamp)
  ).

to_struct_list_test() ->
  Args = [
    [{time_stamp, <<"2012-01-06T00:00:00.000+01:00">>},{value, 42}],
    [{time_stamp, <<"2012-01-07T00:00:00.000+01:00">>},{value, 43}]
  ],
  RequirementList = employee_requirement:new_list(Args),
  Converted = employee_requirement:to_struct_list(RequirementList),
  ?assertEqual(length(Converted), 2).

