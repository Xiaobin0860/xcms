defmodule Xcms.Demos do
  @moduledoc """
  The Demos context.
  """

  import Ecto.Query, warn: false
  alias Xcms.Repo

  alias Xcms.Demos.HUser

  @doc """
  Returns the list of husers.

  ## Examples

      iex> list_husers()
      [%HUser{}, ...]

  """
  def list_husers do
    Repo.all(HUser)
  end

  @doc """
  Gets a single h_user.

  Raises `Ecto.NoResultsError` if the H user does not exist.

  ## Examples

      iex> get_h_user!(123)
      %HUser{}

      iex> get_h_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_h_user!(id), do: Repo.get!(HUser, id)

  @doc """
  Creates a h_user.

  ## Examples

      iex> create_h_user(%{field: value})
      {:ok, %HUser{}}

      iex> create_h_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_h_user(attrs \\ %{}) do
    %HUser{}
    |> HUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a h_user.

  ## Examples

      iex> update_h_user(h_user, %{field: new_value})
      {:ok, %HUser{}}

      iex> update_h_user(h_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_h_user(%HUser{} = h_user, attrs) do
    h_user
    |> HUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a HUser.

  ## Examples

      iex> delete_h_user(h_user)
      {:ok, %HUser{}}

      iex> delete_h_user(h_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_h_user(%HUser{} = h_user) do
    Repo.delete(h_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking h_user changes.

  ## Examples

      iex> change_h_user(h_user)
      %Ecto.Changeset{source: %HUser{}}

  """
  def change_h_user(%HUser{} = h_user) do
    HUser.changeset(h_user, %{})
  end

  alias Xcms.Demos.JUser

  @doc """
  Returns the list of jusers.

  ## Examples

      iex> list_jusers()
      [%JUser{}, ...]

  """
  def list_jusers do
    Repo.all(JUser)
  end

  @doc """
  Gets a single j_user.

  Raises `Ecto.NoResultsError` if the J user does not exist.

  ## Examples

      iex> get_j_user!(123)
      %JUser{}

      iex> get_j_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_j_user!(id), do: Repo.get!(JUser, id)

  @doc """
  Creates a j_user.

  ## Examples

      iex> create_j_user(%{field: value})
      {:ok, %JUser{}}

      iex> create_j_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_j_user(attrs \\ %{}) do
    %JUser{}
    |> JUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a j_user.

  ## Examples

      iex> update_j_user(j_user, %{field: new_value})
      {:ok, %JUser{}}

      iex> update_j_user(j_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_j_user(%JUser{} = j_user, attrs) do
    j_user
    |> JUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a JUser.

  ## Examples

      iex> delete_j_user(j_user)
      {:ok, %JUser{}}

      iex> delete_j_user(j_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_j_user(%JUser{} = j_user) do
    Repo.delete(j_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking j_user changes.

  ## Examples

      iex> change_j_user(j_user)
      %Ecto.Changeset{source: %JUser{}}

  """
  def change_j_user(%JUser{} = j_user) do
    JUser.changeset(j_user, %{})
  end
end
