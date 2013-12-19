-module(employee_tests).
-include_lib("eunit/include/eunit.hrl").

new_test() ->
  out:puts("It should return an empty employee record"),
  Args = [
    {<<"id">>, 42},
    {<<"first_name">>, "Hanna"},
    {<<"last_name">>, "Annah"}
  ],
  Employee = employee:new(Args),
  ?assertEqual(Employee#employee.id, 42),
  ?assertEqual(Employee#employee.first_name, "Hanna"),
  ?assertEqual(Employee#employee.last_name, "Annah").
