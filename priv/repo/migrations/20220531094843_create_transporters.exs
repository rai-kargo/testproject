defmodule Testproject.Repo.Migrations.CreateTransporters do
  use Ecto.Migration

  def change do
    create table(:transporters) do
      add :name, :string
      add :phone_number, :string
      add :npwp_number, :string
      add :status, :string

      timestamps()
    end

    create unique_index(:transporters, [:npwp_number])
    create unique_index(:transporters, [:phone_number])
  end
end
