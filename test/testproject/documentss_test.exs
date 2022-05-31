defmodule Testproject.DocumentssTest do
  use Testproject.DataCase

  alias Testproject.Documentss

  describe "document" do
    alias Testproject.Documentss.Document

    import Testproject.DocumentssFixtures

    @invalid_attrs %{document_url: nil, id: nil, reference_id: nil, reference_table: nil, type: nil}

    test "list_document/0 returns all document" do
      document = document_fixture()
      assert Documentss.list_document() == [document]
    end

    test "get_document!/1 returns the document with given id" do
      document = document_fixture()
      assert Documentss.get_document!(document.id) == document
    end

    test "create_document/1 with valid data creates a document" do
      valid_attrs = %{document_url: "some document_url", id: "some id", reference_id: "some reference_id", reference_table: "some reference_table", type: "some type"}

      assert {:ok, %Document{} = document} = Documentss.create_document(valid_attrs)
      assert document.document_url == "some document_url"
      assert document.id == "some id"
      assert document.reference_id == "some reference_id"
      assert document.reference_table == "some reference_table"
      assert document.type == "some type"
    end

    test "create_document/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Documentss.create_document(@invalid_attrs)
    end

    test "update_document/2 with valid data updates the document" do
      document = document_fixture()
      update_attrs = %{document_url: "some updated document_url", id: "some updated id", reference_id: "some updated reference_id", reference_table: "some updated reference_table", type: "some updated type"}

      assert {:ok, %Document{} = document} = Documentss.update_document(document, update_attrs)
      assert document.document_url == "some updated document_url"
      assert document.id == "some updated id"
      assert document.reference_id == "some updated reference_id"
      assert document.reference_table == "some updated reference_table"
      assert document.type == "some updated type"
    end

    test "update_document/2 with invalid data returns error changeset" do
      document = document_fixture()
      assert {:error, %Ecto.Changeset{}} = Documentss.update_document(document, @invalid_attrs)
      assert document == Documentss.get_document!(document.id)
    end

    test "delete_document/1 deletes the document" do
      document = document_fixture()
      assert {:ok, %Document{}} = Documentss.delete_document(document)
      assert_raise Ecto.NoResultsError, fn -> Documentss.get_document!(document.id) end
    end

    test "change_document/1 returns a document changeset" do
      document = document_fixture()
      assert %Ecto.Changeset{} = Documentss.change_document(document)
    end
  end
end
