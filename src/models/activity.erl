-module(activity).
-export([new/1, new_list/1, fields/0, to_struct_list/1]).

-record(activity, {id, from, to, cathegory, employee_id, workload_id}).

new(PropList) ->
  converter:new_record(activity, record_info(fields, activity), PropList).

new_list(PropListList) -> new_list([], PropListList).

new_list(Activities, []) -> Activities;
new_list(Activities, [Head|SubPropListList]) ->
  new_list([new(Head)|Activities], SubPropListList).

to_struct_list(ActivityList) ->
  converter:record_list_to_struct_list(
    activity, ActivityList, activity:fields()
  ).

fields() -> record_info(fields, activity).
