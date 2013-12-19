-module(employee).
-export([new/1, new_list/1, fields/0, to_struct_list/1, get/2]).

-record(employee, {id,first_name,last_name}).

new(PropList) ->
  converter:new_record(employee, record_info(fields, employee), PropList).

new_list(PropListList) -> new_list([], PropListList).

new_list(Employees, []) -> lists:reverse(Employees);
new_list(Employees, [Head|SubPropListList]) ->
  new_list([new(Head)|Employees], SubPropListList).

to_struct_list(EmployeeList) ->
  converter:record_list_to_struct_list(
    employee, EmployeeList, employee:fields()
  ).

fields() -> record_info(fields, employee).

get(Employee, Attribute) ->
  Index = find_field_index(Attribute),
  element(Index, Employee).


% Internal

find_field_index(Attribute) ->
  find_field_index(record_info(fields, employee), Attribute).

find_field_index(Fields, Attribute) -> find_field_index(Fields, Attribute, 2).

find_field_index([], _, _) -> erlang:error(badarg);
find_field_index([Field| Other], Attribute, Index) ->
  case Field =:= Attribute of
    true -> Index;
    false -> find_field_index(Other, Attribute, Index + 1)
  end.
