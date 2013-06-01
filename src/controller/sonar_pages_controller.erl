-module(sonar_pages_controller, [Req]).
-compile(export_all).

hello('GET', []) ->
  {output, "<strong>Pages#hello</strong>"}.

index('GET', []) ->
  {ok, [{greeting, "Hello, world"}]}.
