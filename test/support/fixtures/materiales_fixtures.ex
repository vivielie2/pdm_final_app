defmodule PdmFinalApp.MaterialesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PdmFinalApp.Materiales` context.
  """

  @doc """
  Generate a material.
  """
  def material_fixture(attrs \\ %{}) do
    {:ok, material} =
      attrs
      |> Enum.into(%{
        cantidad: 42,
        estado: "some estado",
        fecha: ~D[2023-05-09],
        nombre: "some nombre",
        reponsable: "some reponsable",
        sigla_quimica: "some sigla_quimica",
        tipo: "some tipo"
      })
      |> PdmFinalApp.Materiales.create_material()

    material
  end
end
