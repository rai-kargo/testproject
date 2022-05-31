defmodule Testproject.Repo.Migrations.AddStatuVehicles do
  use Ecto.Migration

  def change do
    alter table(:vehicles) do
      add :status, :string
    end
  end
end
