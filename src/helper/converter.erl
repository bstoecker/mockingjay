-module(converter).
-export([new_record/3, flatten_struct_list/1]).

%% EXTERNAL

new_record(RecordName, Fields, PropList) ->
  % List = bin_keys_to_atom_keys(PropList),
  list_to_tuple(
    [RecordName|[proplists:get_value(X, PropList)
      || X <- Fields]]).

flatten_struct_list(PropList) ->
  flatten_struct_list([], PropList).

%% INTERNAL

flatten_struct_list(Result, []) -> Result;
flatten_struct_list(Result, [Head|SubList]) ->
  {struct, Values} = Head,
  flatten_struct_list([bin_keys_to_atom_keys(Values)|Result], SubList).

bin_keys_to_atom_keys(JsonList) ->
  bin_keys_to_atom_keys([], JsonList).

bin_keys_to_atom_keys(Result, []) -> lists:reverse(Result);
bin_keys_to_atom_keys(Result, [{ Key, Value } | SubList]) ->
  NewResult = [{ erlang:binary_to_atom(Key, utf8), Value } | Result],
  bin_keys_to_atom_keys(NewResult, SubList).
