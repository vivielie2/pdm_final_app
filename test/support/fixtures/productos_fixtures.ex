defmodule PdmFinalApp.ProductosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PdmFinalApp.Productos` context.
  """

  @doc """
  Generate a producto.
  """
  def producto_fixture(attrs \\ %{}) do
    {:ok, producto} =
      attrs
      |> Enum.into(%{
        descripcion: "some descripcion",
        estado: "some estado",
        fecha_creacion: ~D[2023-05-09],
        num_id: "some num_id",
        presentacion: "some presentacion"
      })
      |> PdmFinalApp.Productos.create_producto()

    producto
  end
end
