defmodule Testproject.Repo.Migrations.CreateTransporterVehicle do
  use Ecto.Migration

  def change do
    create table(:transporter_vehicle) do
      add :transporter_id, :string
      add :vehicle_id, :string

      timestamps()
    end
  end
end
