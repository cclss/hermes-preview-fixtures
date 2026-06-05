defmodule PhxStrictWeb.PageController do
  use PhxStrictWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
