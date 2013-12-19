-module(converter).
-export([flatten_struct_list/1, record_list_to_struct_list/3]).

%% EXTERNAL

% new_record(RecordName, Fields, PropList) ->
%   list_to_tuple(
%     [RecordName|[proplists:get_value(X, PropList)
%       || X <- Fields]]).

flatten_struct_list(PropList) ->
  flatten_struct_list(PropList, []).

record_list_to_struct_list(RecordName, RecordList, RecordFields) ->
  record_list_to_struct_list(RecordName, RecordList, RecordFields, []).

get(Record, Attribute, Fields) ->
  Index = find_field_index(Attribute, Fields),
  element(Index, Record).

% Internal

find_field_index(Attribute, Fields) -> find_field_index(Attribute, Fields, 2).

find_field_index([], _, _) -> erlang:error(badarg);
find_field_index([Field| Other], Attribute, Index) ->
  case Field =:= Attribute of
    true -> Index;
    false -> find_field_index(Other, Attribute, Index + 1)
  end.

flatten_struct_list([], Result) -> Result;
flatten_struct_list([Head|SubList], Result) ->
  {struct, Values} = Head,
  flatten_struct_list(SubList, [bin_keys_to_atom_keys(Values)|Result]).

record_list_to_struct_list(_, [], _, Result) -> Result;
record_list_to_struct_list(
  RecordName, [Head|SubRecordList], RecordFields, Result
) ->
  Struct = record_to_struct(Head, RecordFields),
  record_list_to_struct_list(
    RecordName, SubRecordList, RecordFields, [Struct|Result]
  ).

record_to_struct(Record, RecordFields) ->
  {struct, lists:zip(RecordFields, tl(tuple_to_list(Record)))}.

bin_keys_to_atom_keys(JsonList) ->
  bin_keys_to_atom_keys([], JsonList).

bin_keys_to_atom_keys(Result, []) -> lists:reverse(Result);
bin_keys_to_atom_keys(Result, [{ Key, Value } | SubList]) ->
  NewResult = [{ erlang:binary_to_atom(Key, utf8), Value } | Result],
  bin_keys_to_atom_keys(NewResult, SubList).
