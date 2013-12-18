-module(workload).
-export([new/1, new_list/1, fields/0, to_struct_list/1]).

-record(workload, {id, interval, employee_requirements}).

new(PropList) ->
  Elem = converter:new_record(
    workload, record_info(fields, workload), PropList
  ),
  ReqList = converter:flatten_struct_list(Elem#workload.employee_requirements),
  EmplReqList = employee_requirement:new_list(ReqList),
  NewWorkload = Elem#workload{
    employee_requirements = EmplReqList
  }.

new_list(PropListList) -> new_list([], PropListList).

new_list(Workloads, []) -> Workloads;
new_list(Workloads, [Head|SubPropListList]) ->
  new_list([new(Head)|Workloads], SubPropListList).

to_struct_list(WorkloadList) ->
  WLList = lists:map(
    fun(X) ->
      X#workload{
        employee_requirements = employee_requirement:to_struct_list(
          X#workload.employee_requirements
        )
      }
    end,
    WorkloadList
  ),
  converter:record_list_to_struct_list(
    workload, WLList, workload:fields()
  ).

fields() -> record_info(fields, workload).


