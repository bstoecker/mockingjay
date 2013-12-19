-include("./record_helper.hrl").

new(PropList, RecordName, Fields) ->
  list_to_tuple(
    [RecordName|[proplists:get_value(X, PropList) || X <- Fields]]
  ).

new_list(PropListList, Fields) -> new_list([], PropListList, Fields).

new_list(Employees, [], _) -> lists:reverse(Employees);
new_list(Employees, [Head|SubPropListList], Fields) ->
  new_list([new(Head)|Employees], SubPropListList, Fields).

to_struct_list(EmployeeList, Fields) ->
  converter:record_list_to_struct_list(
    employee, EmployeeList, Fields
  ).
