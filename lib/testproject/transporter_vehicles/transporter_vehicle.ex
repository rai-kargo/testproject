defmodule Testproject.Transporter_vehicles.Transporter_vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transporter_vehicle" do
    field :transporter_id, :string
    field :vehicle_id, :string

    timestamps()
  end

  @doc false
  def changeset(transporter_vehicle, attrs) do
    transporter_vehicle
    |> cast(attrs, [:transporter_id, :vehicle_id])
    |> validate_required([:transporter_id, :vehicle_id])
  end
end
