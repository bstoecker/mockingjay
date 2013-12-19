-module(employee_test).
-include_lib("eunit/include/eunit.hrl").

spec() ->
  describe("employee", fun() ->
    it("should build a new employee", fun() ->
      Args = [
        {<<"id">>, 42},
        {<<"first_name">>, "Hanna"},
        {<<"last_name">>, "Annah"}
      ],
      Employee = employee:new(Args),
      ?assertEqual(Employee#employee.id, 42),
      ?assertEqual(Employee#employee.first_name, "Hanna"),
      ?assertEqual(Employee#employee.last_name, "Annah")
    end)

  end).