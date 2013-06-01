-module(sonar_website_controller, [Req]).
-compile(export_all).

index('GET', []) ->
  Websites = boss_db:find(website, []),
  {ok, [{websites, Websites}]}.
