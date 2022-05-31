defmodule Testproject.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :license_plate, :string
      add :status, :string
      timestamps()
    end
  end
end
