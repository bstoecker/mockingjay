-module(activity).
-export([new/1, new_list/1, fields/0, to_struct_list/1, get/2]).
-include("../helpers/model_base.hrl").

-record(activity, {id, workload_id, employee_id, from, to, cathegory}).

new(PropList) -> new(PropList, activity, fields()).

new_list(PropListList) -> new_list(PropListList, fields()).

to_struct_list(ActivityList) -> to_struct_list(ActivityList, fields()).

fields() -> record_info(fields, activity).

get(Activity, Attribute) -> get(Activity, Attribute, fields()).
