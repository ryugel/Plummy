defmodule PlummyApiWeb.BaseController do
  use PlummyApiWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to Plummy API! - #{Mix.env()}")
  end
end
