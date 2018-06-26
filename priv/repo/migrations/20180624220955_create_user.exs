defmodule WeliBE.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :username, :string
      add :email, :string
      add :nickname, :string
      add :password, :string
      add :token, :string
    end
    create unique_index(:user, [:username]) 
  end
 
end
