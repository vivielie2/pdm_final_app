defmodule PdmFinalAppWeb.ProductoView do
  use PdmFinalAppWeb, :view
  alias PdmFinalAppWeb.ProductoView

  def render("index.json", %{productos: productos}) do
    %{data: render_many(productos, ProductoView, "producto.json")}
  end

  def render("show.json", %{producto: producto}) do
    %{data: render_one(producto, ProductoView, "producto.json")}
  end

  def render("producto.json", %{producto: producto}) do
    materiales = producto.materiales
                |> Enum.map(& Map.from_struct(&1))
                |> Enum.map(& Enum.reduce([:__meta__, :producto, :producto_id, :inserted_at, :updated_at], &1, fn key, acc -> Map.delete(acc, key) end))

    %{
      id: producto.id,
      num_id: producto.num_id,
      descripcion: producto.descripcion,
      presentacion: producto.presentacion,
      estado: producto.estado,
      fecha_creacion: producto.fecha_creacion,
      materiales: materiales
    }
  end
end
