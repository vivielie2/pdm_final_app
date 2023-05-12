defmodule PdmFinalAppWeb.MaterialControllerTest do
  use PdmFinalAppWeb.ConnCase

  import PdmFinalApp.MaterialesFixtures

  alias PdmFinalApp.Materiales.Material

  @create_attrs %{
    cantidad: 42,
    estado: "some estado",
    fecha: ~D[2023-05-09],
    nombre: "some nombre",
    reponsable: "some reponsable",
    sigla_quimica: "some sigla_quimica",
    tipo: "some tipo"
  }
  @update_attrs %{
    cantidad: 43,
    estado: "some updated estado",
    fecha: ~D[2023-05-10],
    nombre: "some updated nombre",
    reponsable: "some updated reponsable",
    sigla_quimica: "some updated sigla_quimica",
    tipo: "some updated tipo"
  }
  @invalid_attrs %{cantidad: nil, estado: nil, fecha: nil, nombre: nil, reponsable: nil, sigla_quimica: nil, tipo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all materiales", %{conn: conn} do
      conn = get(conn, Routes.material_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create material" do
    test "renders material when data is valid", %{conn: conn} do
      conn = post(conn, Routes.material_path(conn, :create), material: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.material_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "cantidad" => 42,
               "estado" => "some estado",
               "fecha" => "2023-05-09",
               "nombre" => "some nombre",
               "reponsable" => "some reponsable",
               "sigla_quimica" => "some sigla_quimica",
               "tipo" => "some tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.material_path(conn, :create), material: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update material" do
    setup [:create_material]

    test "renders material when data is valid", %{conn: conn, material: %Material{id: id} = material} do
      conn = put(conn, Routes.material_path(conn, :update, material), material: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.material_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "cantidad" => 43,
               "estado" => "some updated estado",
               "fecha" => "2023-05-10",
               "nombre" => "some updated nombre",
               "reponsable" => "some updated reponsable",
               "sigla_quimica" => "some updated sigla_quimica",
               "tipo" => "some updated tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, material: material} do
      conn = put(conn, Routes.material_path(conn, :update, material), material: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete material" do
    setup [:create_material]

    test "deletes chosen material", %{conn: conn, material: material} do
      conn = delete(conn, Routes.material_path(conn, :delete, material))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.material_path(conn, :show, material))
      end
    end
  end

  defp create_material(_) do
    material = material_fixture()
    %{material: material}
  end
end
