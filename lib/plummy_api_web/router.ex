defmodule PlummyApiWeb.Router do
  use PlummyApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PlummyApiWeb do
    pipe_through :api
    get "/", BaseController, :index
    post "/accounts/create", AccountController, :create
  end
end
