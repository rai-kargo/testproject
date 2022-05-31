defmodule Testproject.Transporter_vehicles do
  @moduledoc """
  The Transporter_vehicles context.
  """

  import Ecto.Query, warn: false
  alias Testproject.Repo

  alias Testproject.Transporter_vehicles.Transporter_vehicle

  @doc """
  Returns the list of transporter_vehicle.

  ## Examples

      iex> list_transporter_vehicle()
      [%Transporter_vehicle{}, ...]

  """
  def list_transporter_vehicle do
    Repo.all(Transporter_vehicle)
  end

  @doc """
  Gets a single transporter_vehicle.

  Raises `Ecto.NoResultsError` if the Transporter vehicle does not exist.

  ## Examples

      iex> get_transporter_vehicle!(123)
      %Transporter_vehicle{}

      iex> get_transporter_vehicle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transporter_vehicle!(id), do: Repo.get!(Transporter_vehicle, id)

  @doc """
  Creates a transporter_vehicle.

  ## Examples

      iex> create_transporter_vehicle(%{field: value})
      {:ok, %Transporter_vehicle{}}

      iex> create_transporter_vehicle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transporter_vehicle(attrs \\ %{}) do
    %Transporter_vehicle{}
    |> Transporter_vehicle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transporter_vehicle.

  ## Examples

      iex> update_transporter_vehicle(transporter_vehicle, %{field: new_value})
      {:ok, %Transporter_vehicle{}}

      iex> update_transporter_vehicle(transporter_vehicle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transporter_vehicle(%Transporter_vehicle{} = transporter_vehicle, attrs) do
    transporter_vehicle
    |> Transporter_vehicle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transporter_vehicle.

  ## Examples

      iex> delete_transporter_vehicle(transporter_vehicle)
      {:ok, %Transporter_vehicle{}}

      iex> delete_transporter_vehicle(transporter_vehicle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transporter_vehicle(%Transporter_vehicle{} = transporter_vehicle) do
    Repo.delete(transporter_vehicle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transporter_vehicle changes.

  ## Examples

      iex> change_transporter_vehicle(transporter_vehicle)
      %Ecto.Changeset{data: %Transporter_vehicle{}}

  """
  def change_transporter_vehicle(%Transporter_vehicle{} = transporter_vehicle, attrs \\ %{}) do
    Transporter_vehicle.changeset(transporter_vehicle, attrs)
  end
end
