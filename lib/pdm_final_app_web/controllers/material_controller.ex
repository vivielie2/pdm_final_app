defmodule PdmFinalAppWeb.MaterialController do
  use PdmFinalAppWeb, :controller

  alias PdmFinalApp.Materiales
  alias PdmFinalApp.Materiales.Material

  action_fallback PdmFinalAppWeb.FallbackController

  def index(conn, _params) do
    materiales = Materiales.list_materiales()
    render(conn, "index.json", materiales: materiales)
  end

  def create(conn, %{"material" => material_params}) do
    with {:ok, %Material{} = material} <- Materiales.create_material(material_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.material_path(conn, :show, material))
      |> render("show.json", material: material)
    end
  end

  def show(conn, %{"id" => id}) do
    material = Materiales.get_material!(id)
    render(conn, "show.json", material: material)
  end

  def update(conn, %{"id" => id, "material" => material_params}) do
    material = Materiales.get_material!(id)

    with {:ok, %Material{} = material} <- Materiales.update_material(material, material_params) do
      render(conn, "show.json", material: material)
    end
  end

  def delete(conn, %{"id" => id}) do
    material = Materiales.get_material!(id)

    with {:ok, %Material{}} <- Materiales.delete_material(material) do
      send_resp(conn, :no_content, "")
    end
  end

  def get_by_state(conn, %{"estado" => estado}) do
    materiales = Materiales.get_by_state_materials(String.trim(estado))
    render(conn, :index, materiales: materiales)
  end

  def get_by_responsable_sort_sigla(conn, %{"responsable" => responsable}) do
    materiales = Materiales.get_by_responsable_sort_sigla_materials(String.trim(responsable))
    render(conn, :index, materiales: materiales)
  end

end
