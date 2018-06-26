defmodule Person do
    use Ecto.Schema
    require Ecto.Changeset

    schema "person" do
      # @primary_key {:username, :string, autogenerate: false}
      field :name, :string
      field :last_name, :string
      field :email, :string
    end

    def changeset(person, params \\ %{}) do
      person
      |> Ecto.Changeset.cast(params, [:name, :email, :last_name])
      |> Ecto.Changeset.validate_required([:name, :email, :last_name])
      |> Ecto.Changeset.validate_format(:email, ~r/@/)
      |> Ecto.Changeset.unique_constraint(:email)
    end



end