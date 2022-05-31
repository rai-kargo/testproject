defmodule Testproject.Repo.Migrations.CreateDocument do
  use Ecto.Migration

  def change do
    create table(:document) do
      add :type, :string
      add :document_url, :string
      add :reference_id, :string
      add :reference_table, :string

      timestamps()
    end

    create unique_index(:document, [:reference_id])
  end
end
