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
end
