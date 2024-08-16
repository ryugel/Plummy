defmodule PlummyApiWeb.Auth.AuthorizedPlug do
  alias PlummyApiWeb.Auth.ErrorResponse

  def is_authorized(%{params: %{"account" => params}} = conn, _options) do
    if params["id"] == conn.assigns.account.id do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end

  def is_authorized(%{params: %{"user" => params}} = conn, _options) do
    if params["id"] == conn.assigns.account.user.id do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end
end
