defmodule PdmFinalApp.ProductosTest do
  use PdmFinalApp.DataCase

  alias PdmFinalApp.Productos

  describe "productos" do
    alias PdmFinalApp.Productos.Producto

    import PdmFinalApp.ProductosFixtures

    @invalid_attrs %{descripcion: nil, estado: nil, fecha_creacion: nil, num_id: nil, presentacion: nil}

    test "list_productos/0 returns all productos" do
      producto = producto_fixture()
      assert Productos.list_productos() == [producto]
    end

    test "get_producto!/1 returns the producto with given id" do
      producto = producto_fixture()
      assert Productos.get_producto!(producto.id) == producto
    end

    test "create_producto/1 with valid data creates a producto" do
      valid_attrs = %{descripcion: "some descripcion", estado: "some estado", fecha_creacion: ~D[2023-05-09], num_id: "some num_id", presentacion: "some presentacion"}

      assert {:ok, %Producto{} = producto} = Productos.create_producto(valid_attrs)
      assert producto.descripcion == "some descripcion"
      assert producto.estado == "some estado"
      assert producto.fecha_creacion == ~D[2023-05-09]
      assert producto.num_id == "some num_id"
      assert producto.presentacion == "some presentacion"
    end

    test "create_producto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productos.create_producto(@invalid_attrs)
    end

    test "update_producto/2 with valid data updates the producto" do
      producto = producto_fixture()
      update_attrs = %{descripcion: "some updated descripcion", estado: "some updated estado", fecha_creacion: ~D[2023-05-10], num_id: "some updated num_id", presentacion: "some updated presentacion"}

      assert {:ok, %Producto{} = producto} = Productos.update_producto(producto, update_attrs)
      assert producto.descripcion == "some updated descripcion"
      assert producto.estado == "some updated estado"
      assert producto.fecha_creacion == ~D[2023-05-10]
      assert producto.num_id == "some updated num_id"
      assert producto.presentacion == "some updated presentacion"
    end

    test "update_producto/2 with invalid data returns error changeset" do
      producto = producto_fixture()
      assert {:error, %Ecto.Changeset{}} = Productos.update_producto(producto, @invalid_attrs)
      assert producto == Productos.get_producto!(producto.id)
    end

    test "delete_producto/1 deletes the producto" do
      producto = producto_fixture()
      assert {:ok, %Producto{}} = Productos.delete_producto(producto)
      assert_raise Ecto.NoResultsError, fn -> Productos.get_producto!(producto.id) end
    end

    test "change_producto/1 returns a producto changeset" do
      producto = producto_fixture()
      assert %Ecto.Changeset{} = Productos.change_producto(producto)
    end
  end
end
