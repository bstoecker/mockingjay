-module(employee_requirement).
-export([new/1, new_list/1, fields/0, to_struct_list/1]).

-record(employee_requirement, {time_stamp, value}).

new(PropList) ->
  converter:new_record(
    employee_requirement, record_info(fields, employee_requirement), PropList
  ).

new_list(PropListList) -> new_list([], PropListList).

new_list(Employees, []) -> Employees;
new_list(Employees, [Head|SubPropListList]) ->
  new_list([new(Head)|Employees], SubPropListList).

to_struct_list(EmployeeReqList) ->
  converter:record_list_to_struct_list(
    employee_requirement, EmployeeReqList, employee_requirement:fields()
  ).

fields() -> record_info(fields, employee_requirement).
