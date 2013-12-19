-module(activity_tests).
-include_lib("eunit/include/eunit.hrl").

new_test() ->
  Args = [
    {id, 42},
    {workload_id, 21},
    {employee_id, 174},
    {cathegory, <<"work">>},
    {from, <<"2012-01-01T01:00:00.000+01:00">>},
    {to, <<"2012-01-02T00:00:00.000+01:00">>}
  ],
  Activity = activity:new(Args),
  ?assertEqual(42, activity:get(Activity, id)),
  ?assertEqual(21, activity:get(Activity, workload_id)),
  ?assertEqual(174, activity:get(Activity, employee_id)),
  ?assertEqual(<<"work">>, activity:get(Activity, cathegory)),
  ?assertEqual(
    <<"2012-01-01T01:00:00.000+01:00">>, activity:get(Activity, from)
  ),
  ?assertEqual(<<"2012-01-02T00:00:00.000+01:00">>, activity:get(Activity, to)).

new_list_test() ->
  Args = [
    [
      {id, 42},
      {workload_id, 21},
      {employee_id, 174},
      {cathegory, <<"work">>},
      {from, <<"2012-01-01T01:00:00.000+01:00">>},
      {to, <<"2012-01-02T00:00:00.000+01:00">>}
    ],
    [
      {id, 43},
      {workload_id, 22},
      {employee_id, 175},
      {cathegory, <<"break">>},
      {from, <<"2012-01-03T01:00:00.000+01:00">>},
      {to, <<"2012-01-04T00:00:00.000+01:00">>}
    ]
  ],
  [Activity1, Activity2] = activity:new_list(Args),
  ?assertEqual(42, activity:get(Activity1, id)),
  ?assertEqual(21, activity:get(Activity1, workload_id)),
  ?assertEqual(174, activity:get(Activity1, employee_id)),
  ?assertEqual(<<"work">>, activity:get(Activity1, cathegory)),
  ?assertEqual(
    <<"2012-01-01T01:00:00.000+01:00">>, activity:get(Activity1, from)
  ),
  ?assertEqual(
    <<"2012-01-02T00:00:00.000+01:00">>, activity:get(Activity1, to)
  ),
  ?assertEqual(43, activity:get(Activity2, id)),
  ?assertEqual(22, activity:get(Activity2, workload_id)),
  ?assertEqual(175, activity:get(Activity2, employee_id)),
  ?assertEqual(<<"break">>, activity:get(Activity2, cathegory)),
  ?assertEqual(
    <<"2012-01-03T01:00:00.000+01:00">>, activity:get(Activity2, from)
  ),
  ?assertEqual(
    <<"2012-01-04T00:00:00.000+01:00">>, activity:get(Activity2, to)
  ).

to_struct_list_test() ->
  Args = [
    [
      {id, 42},
      {workload_id, 21},
      {employee_id, 174},
      {cathegory, <<"work">>},
      {from, <<"2012-01-01T01:00:00.000+01:00">>},
      {to, <<"2012-01-02T00:00:00.000+01:00">>}
    ],
    [
      {id, 43},
      {workload_id, 22},
      {employee_id, 175},
      {cathegory, <<"break">>},
      {from, <<"2012-01-03T01:00:00.000+01:00">>},
      {to, <<"2012-01-04T00:00:00.000+01:00">>}
    ]
  ],
  ActivityList = activity:new_list(Args),
  Converted = activity:to_struct_list(ActivityList),
  ?assertEqual(length(Converted), 2).

