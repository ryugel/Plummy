defmodule PlummyApiWeb.Auth.ErrorResponse.Unauthorized do
  defexception message: "Unauthorized", plug_status: 401
end

defmodule PlummyApiWeb.Auth.ErrorResponse.Forbidden do
  defexception message: "You do not have permission to perform this action.", plug_status: 403
end

defmodule PlummyApiWeb.Auth.ErrorResponse.NotFound do
  defexception message: "Not Found", plug_status: 404
end
