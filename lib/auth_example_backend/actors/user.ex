defmodule AuthExampleBackend.Actors.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias AuthExampleBackend.Actors.User


  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password, :password_hash])
    |> validate_required([:email, :password, :password_hash])
  end
end
