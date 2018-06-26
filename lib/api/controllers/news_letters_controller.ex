defmodule Api.NewsLettersController do
    use Api, :controller
    require WeliBE.Repo
    require Person
    require MapUtils
    # use ErrorCodes
    # require Ecto.Query

    def subscribe(conn, person) do
        dataBasePerson = Person.changeset(%Person{}, MapUtils.keys_to_atom(person))
        changeset = Person.changeset(dataBasePerson, %{})
        case WeliBE.Repo.insert(changeset) do
            {:error, error} ->
                IO.inspect error
                json conn, %{error_code: 1}
            res ->
                IO.inspect res
                json conn, :ok
        end

    end
end