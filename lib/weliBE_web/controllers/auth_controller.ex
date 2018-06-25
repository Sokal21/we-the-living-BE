defmodule WeliBEWeb.AuthController do
    use WeliBEWeb, :controller
    require WeliBE.Repo
    require User
    # require Ecto.Query

    def sign_up(conn, user) do
        %{"username" => username, "email" => email, "password" => pwd} = user
        dataBaseUser = %User{username: username, email: email, password: pwd, token: "abcde", nickname: username}
        WeliBE.Repo.insert!(dataBaseUser)
        json conn, %{token: "abcde"}
    end

    def sign_in(conn, user) do
        %{"username" => username, "password" => pwd} = user
        g = User |> WeliBE.Repo.get_by(username: username)
        %{email: email, token: token} = g
        IO.puts email
        json conn, %{email: email, token: token}
    end

end
  