-module(employee).
-export([new/1, new_list/1, fields/0, to_struct_list/1]).

-record(employee, {id,first_name,last_name}).

new(PropList) ->
  converter:new_record(employee, record_info(fields, employee), PropList).

new_list(PropListList) -> new_list([], PropListList).

new_list(Employees, []) -> Employees;
new_list(Employees, [Head|SubPropListList]) ->
  new_list([new(Head)|Employees], SubPropListList).

to_struct_list(EmployeeList) ->
  converter:record_list_to_struct_list(
    employee, EmployeeList, employee:fields()
  ).

fields() ->
  record_info(fields, employee).





% Valid input for new
% [{<<"first_name">>, <<"Jules">>},{<<"last_name">>,<<"Winfield">>},{<<"id">>,1}]
% Valid input for new_list
% [[{<<"first_name">>, <<"Jules">>},{<<"last_name">>,<<"Winfield">>}],[{<<"id">>,1}, {<<"first_name">>, <<"Vincent">>},{<<"last_name">>,<<"Vega">>},{<<"id">>,2}]]

