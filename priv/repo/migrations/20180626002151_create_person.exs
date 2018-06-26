defmodule WeliBE.Repo.Migrations.CreatePerson do
  use Ecto.Migration

  def change do
    create table(:person) do
      add :email, :string
      add :name, :string
      add :last_name, :string
    end
    create unique_index(:person, [:email])
  end
end
