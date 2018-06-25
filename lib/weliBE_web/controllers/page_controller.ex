defmodule WeliBEWeb.PageController do
  use WeliBEWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
