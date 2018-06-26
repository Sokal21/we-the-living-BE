defmodule Api.AuthController do
    use Api, :controller
    require WeliBE.Repo
    require User
    # require Ecto.Query

    def sign_up(conn, user) do
        %{"username" => username, "email" => email, "password" => pwd} = user
        dataBaseUser = User.changeset(%User{},%{username: username, email: email, password: pwd, token: "abcde", nickname: username})
        changeset = User.changeset(dataBaseUser, %{})
        {:error, a} = WeliBE.Repo.insert!(changeset)
        # IO.inspect a
        json conn, %{token: "abcde"}
    end

    def sign_in(conn, user) do
        %{"username" => username, "password" => pwd} = user
        g = User |> WeliBE.Repo.one(username: username)
        %{email: email, token: token} = g
        IO.puts email
        json conn, %{email: email, token: token}
    end


end
  