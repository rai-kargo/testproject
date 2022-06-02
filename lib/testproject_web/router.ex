defmodule TestprojectWeb.Router do
  use TestprojectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TestprojectWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/vehicles", VehicleController
    resources "/transporters", TransporterController
    resources "/transporter_vehicles", Transporter_vehicleController
    resources "/documentss", DocumentController
  end


  scope "graphiql" do
    forward "/", Absinthe.Plug.GraphiQL, schema: TestprojectWeb.Schema
  end

  # Other scopes may use custom stacks.
  # scope "/api", TestprojectWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TestprojectWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
