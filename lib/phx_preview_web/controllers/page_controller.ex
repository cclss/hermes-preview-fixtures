defmodule PhxPreviewWeb.PageController do
  use PhxPreviewWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
