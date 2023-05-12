defmodule PdmFinalAppWeb.MaterialView do
  use PdmFinalAppWeb, :view
  alias PdmFinalAppWeb.MaterialView

  def render("index.json", %{materiales: materiales}) do
    %{data: render_many(materiales, MaterialView, "material.json")}
  end

  def render("show.json", %{material: material}) do
    %{data: render_one(material, MaterialView, "material.json")}
  end

  def render("material.json", %{material: material}) do
        #Bring the producto
        producto = [material.producto]
        |> Enum.map(& Map.from_struct(&1))
        |> Enum.map(& Enum.reduce([:__meta__, :materiales, :inserted_at, :updated_at], &1, fn key, val -> Map.delete(val, key) end))
        |> List.first
    %{
      id: material.id,
      sigla_quimica: material.sigla_quimica,
      nombre: material.nombre,
      tipo: material.tipo,
      cantidad: material.cantidad,
      estado: material.estado,
      fecha: material.fecha,
      reponsable: material.reponsable,
      producto: producto
    }
  end
end
