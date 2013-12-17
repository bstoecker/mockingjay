to_struct({_, Value}) ->
  Value.

to_struct_list(StructList) ->
  to_struct_list([], StructList).

to_struct_list(Result, []) -> Result;
to_struct_list(Result, [First|Sublist]) ->
  to_struct_list([to_struct(First)|Result], Sublist).







  
