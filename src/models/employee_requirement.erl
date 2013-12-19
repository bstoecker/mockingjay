-module(employee_requirement).
-export([new/1, new_list/1, fields/0, to_struct_list/1, get/2]).
-include("../helpers/model_base.hrl").

-record(employee_requirement, {time_stamp, value}).

new(PropList) ->
  new(PropList, employee_requirement, fields()).

new_list(PropListList) -> new_list(PropListList, fields()).

to_struct_list(RequirementList) -> to_struct_list(RequirementList, fields()).

fields() -> record_info(fields, employee_requirement).

get(Requirement, Attribute) -> get(Requirement, Attribute, fields()).

