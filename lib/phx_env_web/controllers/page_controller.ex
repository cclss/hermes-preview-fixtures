defmodule PhxEnvWeb.PageController do
  use PhxEnvWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
  def env(conn, _params) do
    text(conn, System.get_env("STRIPE_KEY") || "unset")
  end
end
