defmodule Testproject.Vehicles.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}
  schema "vehicles" do
    field :license_plate, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:id, :license_plate])
    |> validate_required([:id, :license_plate])
  end
end
