defmodule Testproject.Transporter_vehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Testproject.Transporter_vehicles` context.
  """

  @doc """
  Generate a transporter_vehicle.
  """
  def transporter_vehicle_fixture(attrs \\ %{}) do
    {:ok, transporter_vehicle} =
      attrs
      |> Enum.into(%{
        transporter_id: "some transporter_id",
        vehicle_id: "some vehicle_id"
      })
      |> Testproject.Transporter_vehicles.create_transporter_vehicle()

    transporter_vehicle
  end
end
