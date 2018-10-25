defmodule AvRetrospectivePodcasts.Podcast.Episodes do
  use Ecto.Schema
  import Ecto.Changeset
  alias AvRetrospectivePodcasts.Podcast.Episodes

  embedded_schema do
    field :youtube_id, :string
  end

  @doc false
  def changeset(%Episodes{} = episodes, attrs) do
    episodes
    |> cast(attrs, [:youtube_id])
    |> validate_required([:youtube_id])
  end


  def retrieveEpisode do
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
end
