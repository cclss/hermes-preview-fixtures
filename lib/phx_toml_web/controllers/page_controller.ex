defmodule PhxTomlWeb.PageController do
  use PhxTomlWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
