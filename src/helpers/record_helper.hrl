get(Record, Attribute, Fields) ->
  element(find_field_index(Attribute, Fields), Record).

find_field_index(Attribute, Fields) -> find_field_index(Attribute, Fields, 2).

find_field_index(_, [], _) -> erlang:error(badarg);
find_field_index(Attribute, [Field| Other], Index) ->
  case Field =:= Attribute of
    true -> Index;
    false -> find_field_index(Attribute, Other, Index + 1)
  end.
