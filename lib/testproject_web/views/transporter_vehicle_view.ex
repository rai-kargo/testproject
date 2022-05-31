defmodule TestprojectWeb.Transporter_vehicleView do
  use TestprojectWeb, :view
  alias TestprojectWeb.Transporter_vehicleView

  def render("index.json", %{transporter_vehicle: transporter_vehicle}) do
    %{data: render_many(transporter_vehicle, Transporter_vehicleView, "transporter_vehicle.json")}
  end

  def render("show.json", %{transporter_vehicle: transporter_vehicle}) do
    %{data: render_one(transporter_vehicle, Transporter_vehicleView, "transporter_vehicle.json")}
  end

  def render("transporter_vehicle.json", %{transporter_vehicle: transporter_vehicle}) do
    %{
      id: transporter_vehicle.id,
      transporter_id: transporter_vehicle.transporter_id,
      vehicle_id: transporter_vehicle.vehicle_id
    }
  end
end
