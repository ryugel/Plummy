defmodule PlummyApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :plummy_api,
    module: PlummyApiWeb.Auth.Guardian,
    error_handler: PlummyApiWeb.Auth.GuardianErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
