-include("../../deps/jsonerl/src/jsonerl.hrl").

get_body(Req) ->
  jsonerl:decode(Req:recv_body()).

get_element_list(Key, Input) -> 
  {_, Result} = lists:keyfind(Key, 1, tuple_to_list(Input)),
  Result.

create_record_list(RecordName, StructList) ->
  create_record_list(RecordName, StructList, []).
create_record_list(_, [], Result) -> Result;
create_record_list(RecordName, [Head|StructListTail], Result) ->
  out:puts("~nHead: ~p, Tail: ~p, Record: ~p, Result: ~p", [Head, StructListTail, RecordName, Result]),
  Record = jsonerl:struct_to_record(RecordName, tuple_to_list(Head)),
  out:puts("~nRecord: ~p", [Record]),
  create_record_list(
    RecordName,
    StructListTail,
    [Record | Result]
  ).




% struct_to_record









values_of(Results, []) -> lists:reverse(Results);
values_of(Results, [Tupel|TupelList]) ->
  values_of([value_of(Tupel)|Results], TupelList).


value_of({_,Value}) -> Value;
value_of([Elem|Sublist]) -> values_of([value_of(Elem)], Sublist);
value_of(Elem) -> Elem.

get_value(Key, DeserializedBody, Default) ->
  Element = proplists:get_value(Key, DeserializedBody, Default),
  value_of(Element).

get_value(Key, DeserializedBody) -> get_value(Key, DeserializedBody, undefined).

