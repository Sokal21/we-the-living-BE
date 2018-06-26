defmodule Api.Router do
  use Api, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Api do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", Api do
    pipe_through :api

    post "/sign_up", AuthController, :sign_up
    post "/sign_in", AuthController, :sign_in
  end

  scope "/newsletters", Api do
    pipe_through :api

    post "/subscribe", NewsLettersController, :subscribe
    # post "/unsubscribe", NewsLetterController, :unsubscribe  
  end

end
