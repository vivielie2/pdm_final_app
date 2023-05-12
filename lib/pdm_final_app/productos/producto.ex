defmodule PdmFinalApp.Productos.Producto do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "productos" do
    field :descripcion, :string
    field :estado, :string
    field :fecha_creacion, :date
    field :num_id, :string
    field :presentacion, :string
    #has_many :productos, PdmFinalApp.Materiales.Material
    has_many :materiales, PdmFinalApp.Materiales.Material
    timestamps()
  end

  @doc false
  def changeset(producto, attrs) do
    producto
    |> cast(attrs, [:num_id, :descripcion, :presentacion, :estado, :fecha_creacion])
    |> validate_required([:num_id, :descripcion, :presentacion, :estado, :fecha_creacion])
    |> validate_length(:num_id, max: 6, message: "Codigo de producto debe tener 6 digitos")
    |> unique_constraint(:num_id, message: "Codigo de producto ya existe")
  end
end
