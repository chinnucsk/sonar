-module(sonar_website_controller, [Req]).
-compile(export_all).

index('GET', []) ->
  Websites = boss_db:find(website, []),
  {ok, [{websites, Websites}]}.

create('GET', []) ->
  {ok, []};

create('POST', []) ->
  Url = xmerl_lib:export_text(Req:post_param("website_url")),
  NewWebsite = website:new(id, Url),
  case NewWebsite:save() of
    {ok, SavedWebsite} ->  {redirect, [{action, "view"}, {id, SavedWebsite:id()}]};
    {error, ErrorList} -> {ok, [{errors, ErrorList}, {new_website, NewWebsite}]}
  end.

testxxx('GET', [Id]) ->
  case boss_db:find(Id) of
    {error, Reason} -> {redirect, [{action, "index"}]};
    undefined -> {redirect, [{action, "create"}]};
    Website ->
      {ok, [{website, Website}]}
  end.
