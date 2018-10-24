defmodule AvRetrospectivePodcasts do
  @moduledoc """
  AvRetrospectivePodcasts keeps the contexts that define your domain
  and business logic.
  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  case HTTPoison.get("https://www.agileventures.org/events/av-retrospective") do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
      Floki.find(body, ".yt_link")
      |> Floki.attribute("id")
      |> Enum.at(0)
    {:ok, %HTTPoison.Response{status_code: 404}} ->
      IO.puts "Not found :("
    {:error, %HTTPoison.Error{reason: reason}} ->
      IO.inspect reason
  end
end
