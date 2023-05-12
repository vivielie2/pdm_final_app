defmodule PdmFinalApp.Repo.Migrations.CreateProductos do
  use Ecto.Migration

  def change do
    create table(:productos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_id, :string
      add :descripcion, :string
      add :presentacion, :string
      add :estado, :string
      add :fecha_creacion, :date

      timestamps()
    end

    create unique_index(:productos, [:num_id])
  end
end
