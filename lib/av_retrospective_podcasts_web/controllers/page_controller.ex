defmodule AvRetrospectivePodcastsWeb.PageController do
  use AvRetrospectivePodcastsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
