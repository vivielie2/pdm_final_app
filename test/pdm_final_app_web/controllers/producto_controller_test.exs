defmodule PdmFinalAppWeb.ProductoControllerTest do
  use PdmFinalAppWeb.ConnCase

  import PdmFinalApp.ProductosFixtures

  alias PdmFinalApp.Productos.Producto

  @create_attrs %{
    descripcion: "some descripcion",
    estado: "some estado",
    fecha_creacion: ~D[2023-05-09],
    num_id: "some num_id",
    presentacion: "some presentacion"
  }
  @update_attrs %{
    descripcion: "some updated descripcion",
    estado: "some updated estado",
    fecha_creacion: ~D[2023-05-10],
    num_id: "some updated num_id",
    presentacion: "some updated presentacion"
  }
  @invalid_attrs %{descripcion: nil, estado: nil, fecha_creacion: nil, num_id: nil, presentacion: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all productos", %{conn: conn} do
      conn = get(conn, Routes.producto_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create producto" do
    test "renders producto when data is valid", %{conn: conn} do
      conn = post(conn, Routes.producto_path(conn, :create), producto: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.producto_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descripcion" => "some descripcion",
               "estado" => "some estado",
               "fecha_creacion" => "2023-05-09",
               "num_id" => "some num_id",
               "presentacion" => "some presentacion"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.producto_path(conn, :create), producto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update producto" do
    setup [:create_producto]

    test "renders producto when data is valid", %{conn: conn, producto: %Producto{id: id} = producto} do
      conn = put(conn, Routes.producto_path(conn, :update, producto), producto: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.producto_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descripcion" => "some updated descripcion",
               "estado" => "some updated estado",
               "fecha_creacion" => "2023-05-10",
               "num_id" => "some updated num_id",
               "presentacion" => "some updated presentacion"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, producto: producto} do
      conn = put(conn, Routes.producto_path(conn, :update, producto), producto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete producto" do
    setup [:create_producto]

    test "deletes chosen producto", %{conn: conn, producto: producto} do
      conn = delete(conn, Routes.producto_path(conn, :delete, producto))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.producto_path(conn, :show, producto))
      end
    end
  end

  defp create_producto(_) do
    producto = producto_fixture()
    %{producto: producto}
  end
end
