defmodule PdmFinalApp.Materiales.Material do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "materiales" do
    field :cantidad, :integer
    field :estado, :string
    field :fecha, :date
    field :nombre, :string
    field :reponsable, :string
    field :sigla_quimica, :string
    field :tipo, :string
    #field :producto_id, :binary_id
    belongs_to :producto, PdmFinalApp.Productos.Producto
    timestamps()
  end

  @doc false
  def changeset(material, attrs) do
    material
    |> cast(attrs, [:sigla_quimica, :nombre, :tipo, :cantidad, :estado, :fecha, :reponsable, :producto_id])
    |> validate_required([:sigla_quimica, :nombre, :tipo, :cantidad, :estado, :fecha, :reponsable])
    |> unique_constraint(:sigla_quimica, message: "Material ya existe")
  end
end
