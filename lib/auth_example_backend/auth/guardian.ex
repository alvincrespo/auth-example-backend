defmodule AuthExampleBackend.Auth.Guardian do
  use Guardian, otp_app: :auth_example_backend

  alias AuthExampleBackend.Actors
  alias AuthExampleBackend.Actors.User

  def subject_for_token(%User{} = user, _claims) do
    {:ok, user.id}
  end

  def subject_for_token(_) do
    {:error, "Unknown resource type"}
  end

  def resource_from_claims(claims) do
    {:ok, %{id: claims["sub"]}}
  end
end
