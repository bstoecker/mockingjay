-module(converter).
-export([new_record/3, flatten_struct_list/1, record_list_to_struct_list/3]).

%% EXTERNAL

new_record(RecordName, Fields, PropList) ->
  list_to_tuple(
    [RecordName|[proplists:get_value(X, PropList)
      || X <- Fields]]).

flatten_struct_list(PropList) ->
  flatten_struct_list(PropList, []).

record_list_to_struct_list(RecordName, RecordList, RecordFields) ->
  out:puts("Hello, I'm here", []),
  record_list_to_struct_list(RecordName, RecordList, RecordFields, []).

%% INTERNAL

flatten_struct_list([], Result) -> Result;
flatten_struct_list([Head|SubList], Result) ->
  {struct, Values} = Head,
  flatten_struct_list(SubList, [bin_keys_to_atom_keys(Values)|Result]).

record_list_to_struct_list(_, [], _, Result) -> Result;
record_list_to_struct_list(
  RecordName, [Head|SubRecordList], RecordFields, Result
) ->
  out:puts("record_to_struct: ~p; ~p", [Head, RecordFields]),
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
