defmodule Testproject.TransportersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Testproject.Transporters` context.
  """

  @doc """
  Generate a unique transporter npwp_number.
  """
  def unique_transporter_npwp_number, do: "some npwp_number#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique transporter phone_number.
  """
  def unique_transporter_phone_number, do: "some phone_number#{System.unique_integer([:positive])}"

  @doc """
  Generate a transporter.
  """
  def transporter_fixture(attrs \\ %{}) do
    {:ok, transporter} =
      attrs
      |> Enum.into(%{
        id: "some id",
        name: "some name",
        npwp_number: unique_transporter_npwp_number(),
        phone_number: unique_transporter_phone_number(),
        status: "some status"
      })
      |> Testproject.Transporters.create_transporter()

    transporter
  end
end
