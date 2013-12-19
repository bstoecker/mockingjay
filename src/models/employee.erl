-module(employee).
-export([new/1, new_list/1, fields/0, to_struct_list/1, get/2]).
-include("../helpers/model_base.hrl").

-record(employee, {id,first_name,last_name}).

new(PropList) ->
  new(PropList, employee, fields()).

new_list(PropListList) -> new_list(PropListList, fields()).

to_struct_list(EmployeeList) -> to_struct_list(EmployeeList, fields()).

fields() -> record_info(fields, employee).

get(Employee, Attribute) -> get(Employee, Attribute, fields()).
