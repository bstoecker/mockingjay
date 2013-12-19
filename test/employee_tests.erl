-module(employee_tests).
-include_lib("eunit/include/eunit.hrl").

new_test() ->
  Args = [{id, 42},{first_name, "Hanna"},{last_name, "Annah"}],
  Employee = employee:new(Args),
  ?assertEqual(42, employee:get(Employee, id)),
  ?assertEqual("Hanna", employee:get(Employee, first_name)),
  ?assertEqual("Annah", employee:get(Employee, last_name)).

new_list_test() ->
  Args = [
    [{id, 42},{first_name, "Hanna"},{last_name, "Annah"}],
    [{id, 43},{first_name, "Shawn"},{last_name, "Sheep"}]
  ],
  [Employee1, Employee2] = employee:new_list(Args),
  ?assertEqual(42, employee:get(Employee1, id)),
  ?assertEqual("Hanna", employee:get(Employee1, first_name)),
  ?assertEqual("Annah", employee:get(Employee1, last_name)),
  ?assertEqual(43, employee:get(Employee2, id)),
  ?assertEqual("Shawn", employee:get(Employee2, first_name)),
  ?assertEqual("Sheep", employee:get(Employee2, last_name)).

to_struct_list_test() ->
  Args = [
    [{id, 42},{first_name, "Hanna"},{last_name, "Annah"}],
    [{id, 43},{first_name, "Shawn"},{last_name, "Sheep"}]
  ],
  EmployeeList = employee:new_list(Args),
  Converted = employee:to_struct_list(EmployeeList),
  ?assertEqual(length(Converted), 2).




  % to_struct_list