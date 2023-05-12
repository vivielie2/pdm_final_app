defmodule PdmFinalApp.Productos do
  @moduledoc """
  The Productos context.
  """

  import Ecto.Query, warn: false
  alias PdmFinalApp.Repo

  alias PdmFinalApp.Productos.Producto

  @doc """
  Returns the list of productos.

  ## Examples

      iex> list_productos()
      [%Producto{}, ...]

  """
  def list_productos do
    Repo.all(Producto) |> Repo.preload(:materiales)
    #Repo.all(Producto) |> Repo.preload(:material)
  end

  @doc """
  Gets a single producto.

  Raises `Ecto.NoResultsError` if the Producto does not exist.

  ## Examples

      iex> get_producto!(123)
      %Producto{}

      iex> get_producto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_producto!(id), do: Repo.get!(Producto, id) |> Repo.preload(:materiales)

  @doc """
  Creates a producto.

  ## Examples

      iex> create_producto(%{field: value})
      {:ok, %Producto{}}

      iex> create_producto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_producto(attrs \\ %{}) do
    %Producto{}
    |> Repo.preload(:materiales)
    |> Producto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a producto.

  ## Examples

      iex> update_producto(producto, %{field: new_value})
      {:ok, %Producto{}}

      iex> update_producto(producto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_producto(%Producto{} = producto, attrs) do
    producto
    |> Producto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a producto.

  ## Examples

      iex> delete_producto(producto)
      {:ok, %Producto{}}

      iex> delete_producto(producto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_producto(%Producto{} = producto) do
    Repo.delete(producto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking producto changes.

  ## Examples

      iex> change_producto(producto)
      %Ecto.Changeset{data: %Producto{}}

  """
  def change_producto(%Producto{} = producto, attrs \\ %{}) do
    Producto.changeset(producto, attrs)
  end

  def get_by_state_products(estado) do
    strSql = from(a in Producto, where: a.estado == ^estado)
    Repo.all(strSql) |> Repo.preload(:materiales)
  end

end
