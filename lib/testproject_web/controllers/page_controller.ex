defmodule TestprojectWeb.PageController do
  use TestprojectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
