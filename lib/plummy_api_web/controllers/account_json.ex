defmodule PlummyApiWeb.AccountJSON do
  alias PlummyApi.Accounts.Account
  alias PlummyApi.Users.User

  @doc """
  Renders a list of accounts.
  """
  def index(%{accounts: accounts}) do
    %{data: for(account <- accounts, do: data(account))}
  end

  @doc """
  Renders a single account.
  """
  def show(%{account: account}) do
    %{data: data(account)}
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      email: account.email,
      hash_password: account.hash_password
    }
  end

  def render("account_token.json", %{account: account, token: token}) do
    %{
      id: account.id,
      email: account.email,
      token: token
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      full_name: user.full_name,
      gender: user.gender,
      biography: user.biography
    }
  end

  def render("full_account.json", %{account: account}) do
    %{
      id: account.id,
      email: account.email,
      user: render_user(account.user)
    }
  end

  defp render_user(%User{} = user) do
    %{
      id: user.id,
      full_name: user.full_name,
      gender: user.gender,
      biography: user.biography,
      profile_picture: user.profile_picture
    }
  end
end
