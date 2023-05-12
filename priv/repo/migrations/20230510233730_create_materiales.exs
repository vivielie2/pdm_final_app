defmodule PdmFinalApp.Repo.Migrations.CreateMateriales do
  use Ecto.Migration

  def change do
    create table(:materiales, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :sigla_quimica, :string
      add :nombre, :string
      add :tipo, :string
      add :cantidad, :integer
      add :estado, :string
      add :fecha, :date
      add :reponsable, :string
      add :producto_id, references(:productos, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:materiales, [:producto_id, :sigla_quimica])
  end
end
