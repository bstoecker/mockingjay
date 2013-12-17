-module(employee).
-export([new/1, new_list/1]).
-include("../helper/struct_helper.hrl").

-record(employee, {id,first_name,last_name}).

new(PropList) ->
  converter:new_record(employee, record_info(fields, employee), PropList).

new_list(PropListList) -> new_list([], PropListList).

%% With lists:reverse????
new_list(Employees, []) -> Employees;
new_list(Employees, [Head|SubPropListList]) ->
  out:puts("Head: ~p", [Head]),
  new_list([new(Head)|Employees], SubPropListList).

%TODO: check https://github.com/lordnull/rec2json


% Valid input for new
% [{<<"first_name">>, <<"Jules">>},{<<"last_name">>,<<"Winfield">>},{<<"id">>,1}]
% Valid input for new_list
% [[{<<"first_name">>, <<"Jules">>},{<<"last_name">>,<<"Winfield">>}],[{<<"id">>,1}, {<<"first_name">>, <<"Vincent">>},{<<"last_name">>,<<"Vega">>},{<<"id">>,2}]]

