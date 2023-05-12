defmodule PdmFinalApp.Materiales do
  @moduledoc """
  The Materiales context.
  """

  import Ecto.Query, warn: false
  alias PdmFinalApp.Repo

  alias PdmFinalApp.Materiales.Material

  @doc """
  Returns the list of materiales.

  ## Examples

      iex> list_materiales()
      [%Material{}, ...]

  """
  def list_materiales do
    Repo.all(Material) |> Repo.preload(:producto)
  end

  @doc """
  Gets a single material.

  Raises `Ecto.NoResultsError` if the Material does not exist.

  ## Examples

      iex> get_material!(123)
      %Material{}

      iex> get_material!(456)
      ** (Ecto.NoResultsError)

  """
  def get_material!(id), do: Repo.get!(Material, id)

  @doc """
  Creates a material.

  ## Examples

      iex> create_material(%{field: value})
      {:ok, %Material{}}

      iex> create_material(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_material(attrs \\ %{}) do
    %Material{}
    |> Material.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a material.

  ## Examples

      iex> update_material(material, %{field: new_value})
      {:ok, %Material{}}

      iex> update_material(material, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_material(%Material{} = material, attrs) do
    material
    |> Material.changeset(attrs)
    |> Repo.update()
  end


  @doc """
  Deletes a material.

  ## Examples

      iex> delete_material(material)
      {:ok, %Material{}}

      iex> delete_material(material)
      {:error, %Ecto.Changeset{}}

  """
  def delete_material(%Material{} = material) do
    Repo.delete(material)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking material changes.

  ## Examples

      iex> change_material(material)
      %Ecto.Changeset{data: %Material{}}

  """
  def change_material(%Material{} = material, attrs \\ %{}) do
    Material.changeset(material, attrs)
  end

  def get_by_state_materials(estado) do
    strSql = from(b in Material, where: b.estado == ^estado)
    Repo.all(strSql) |> Repo.preload(:producto)
  end

  def get_by_responsable_sort_sigla_materials(filtro_responsable) do

    responsable = "%#{filtro_responsable}%"
    strSql = #from(c in Material, where: ilike(c.responsable, ^responsable)
    from(c in Material, where: ilike(c.reponsable, ^responsable), order_by: c.sigla_quimica )
    Repo.all(strSql) |> Repo.preload(:producto)
  end


end
