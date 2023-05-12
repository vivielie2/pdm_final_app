defmodule PdmFinalApp.MaterialesTest do
  use PdmFinalApp.DataCase

  alias PdmFinalApp.Materiales

  describe "materiales" do
    alias PdmFinalApp.Materiales.Material

    import PdmFinalApp.MaterialesFixtures

    @invalid_attrs %{cantidad: nil, estado: nil, fecha: nil, nombre: nil, reponsable: nil, sigla_quimica: nil, tipo: nil}

    test "list_materiales/0 returns all materiales" do
      material = material_fixture()
      assert Materiales.list_materiales() == [material]
    end

    test "get_material!/1 returns the material with given id" do
      material = material_fixture()
      assert Materiales.get_material!(material.id) == material
    end

    test "create_material/1 with valid data creates a material" do
      valid_attrs = %{cantidad: 42, estado: "some estado", fecha: ~D[2023-05-09], nombre: "some nombre", reponsable: "some reponsable", sigla_quimica: "some sigla_quimica", tipo: "some tipo"}

      assert {:ok, %Material{} = material} = Materiales.create_material(valid_attrs)
      assert material.cantidad == 42
      assert material.estado == "some estado"
      assert material.fecha == ~D[2023-05-09]
      assert material.nombre == "some nombre"
      assert material.reponsable == "some reponsable"
      assert material.sigla_quimica == "some sigla_quimica"
      assert material.tipo == "some tipo"
    end

    test "create_material/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Materiales.create_material(@invalid_attrs)
    end

    test "update_material/2 with valid data updates the material" do
      material = material_fixture()
      update_attrs = %{cantidad: 43, estado: "some updated estado", fecha: ~D[2023-05-10], nombre: "some updated nombre", reponsable: "some updated reponsable", sigla_quimica: "some updated sigla_quimica", tipo: "some updated tipo"}

      assert {:ok, %Material{} = material} = Materiales.update_material(material, update_attrs)
      assert material.cantidad == 43
      assert material.estado == "some updated estado"
      assert material.fecha == ~D[2023-05-10]
      assert material.nombre == "some updated nombre"
      assert material.reponsable == "some updated reponsable"
      assert material.sigla_quimica == "some updated sigla_quimica"
      assert material.tipo == "some updated tipo"
    end

    test "update_material/2 with invalid data returns error changeset" do
      material = material_fixture()
      assert {:error, %Ecto.Changeset{}} = Materiales.update_material(material, @invalid_attrs)
      assert material == Materiales.get_material!(material.id)
    end

    test "delete_material/1 deletes the material" do
      material = material_fixture()
      assert {:ok, %Material{}} = Materiales.delete_material(material)
      assert_raise Ecto.NoResultsError, fn -> Materiales.get_material!(material.id) end
    end

    test "change_material/1 returns a material changeset" do
      material = material_fixture()
      assert %Ecto.Changeset{} = Materiales.change_material(material)
    end
  end
end
