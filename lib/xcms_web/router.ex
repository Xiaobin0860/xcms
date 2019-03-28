defmodule XcmsWeb.Router do
  use XcmsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", XcmsWeb do
    pipe_through :browser

    resources "/husers", HUserController

    resources "/posts", PostController

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", XcmsWeb do
    pipe_through :api

    resources "/jusers", JUserController, except: [:new, :edit]
  end
end
