defmodule PhxEnvReqWeb.Router do
  use PhxEnvReqWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PhxEnvReqWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxEnvReqWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/__env", PageController, :env
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxEnvReqWeb do
  #   pipe_through :api
  # end
end
