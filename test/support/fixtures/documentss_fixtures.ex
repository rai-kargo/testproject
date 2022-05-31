defmodule Testproject.DocumentssFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Testproject.Documentss` context.
  """

  @doc """
  Generate a unique document reference_id.
  """
  def unique_document_reference_id, do: "some reference_id#{System.unique_integer([:positive])}"

  @doc """
  Generate a document.
  """
  def document_fixture(attrs \\ %{}) do
    {:ok, document} =
      attrs
      |> Enum.into(%{
        document_url: "some document_url",
        id: "some id",
        reference_id: unique_document_reference_id(),
        reference_table: "some reference_table",
        type: "some type"
      })
      |> Testproject.Documentss.create_document()

    document
  end
end
