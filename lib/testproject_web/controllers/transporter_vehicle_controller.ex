defmodule TestprojectWeb.Transporter_vehicleController do
  use TestprojectWeb, :controller

  alias Testproject.Transporter_vehicles
  alias Testproject.Transporter_vehicles.Transporter_vehicle

  action_fallback TestprojectWeb.FallbackController

  def index(conn, _params) do
    transporter_vehicle = Transporter_vehicles.list_transporter_vehicle()
    render(conn, "index.json", transporter_vehicle: transporter_vehicle)
  end

  def create(conn, %{"transporter_vehicle" => transporter_vehicle_params}) do
    with {:ok, %Transporter_vehicle{} = transporter_vehicle} <- Transporter_vehicles.create_transporter_vehicle(transporter_vehicle_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.transporter_vehicle_path(conn, :show, transporter_vehicle))
      |> render("show.json", transporter_vehicle: transporter_vehicle)
    end
  end

  def show(conn, %{"id" => id}) do
    transporter_vehicle = Transporter_vehicles.get_transporter_vehicle!(id)
    render(conn, "show.json", transporter_vehicle: transporter_vehicle)
  end

  def update(conn, %{"id" => id, "transporter_vehicle" => transporter_vehicle_params}) do
    transporter_vehicle = Transporter_vehicles.get_transporter_vehicle!(id)

    with {:ok, %Transporter_vehicle{} = transporter_vehicle} <- Transporter_vehicles.update_transporter_vehicle(transporter_vehicle, transporter_vehicle_params) do
      render(conn, "show.json", transporter_vehicle: transporter_vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    transporter_vehicle = Transporter_vehicles.get_transporter_vehicle!(id)

    with {:ok, %Transporter_vehicle{}} <- Transporter_vehicles.delete_transporter_vehicle(transporter_vehicle) do
      send_resp(conn, :no_content, "")
    end
  end
end
