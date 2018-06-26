defmodule User do
    use Ecto.Schema
    require Ecto.Changeset
    schema "user" do
      # @primary_key {:username, :string, autogenerate: false}
      field :username, :string
      field :email, :string
      field :nickname, :string
      field :password, :string
      field :token, :string
    end

    def changeset(user, params \\ %{}) do
      user
      |> Ecto.Changeset.cast(params, [:username, :email, :password, :nickname, :token])
      |> Ecto.Changeset.validate_required([:username, :email, :password, :token])
      |> Ecto.Changeset.validate_format(:email, ~r/@/)
      |> Ecto.Changeset.unique_constraint(:username)
    end


end