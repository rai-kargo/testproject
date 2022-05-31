defmodule TestprojectWeb.DocumentController do
  use TestprojectWeb, :controller

  alias Testproject.Documentss
  alias Testproject.Documentss.Document

  action_fallback TestprojectWeb.FallbackController

  def index(conn, _params) do
    document = Documentss.list_document()
    render(conn, "index.json", document: document)
  end

  def create(conn, %{"document" => document_params}) do
    with {:ok, %Document{} = document} <- Documentss.create_document(document_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.document_path(conn, :show, document))
      |> render("show.json", document: document)
    end
  end

  def show(conn, %{"id" => id}) do
    document = Documentss.get_document!(id)
    render(conn, "show.json", document: document)
  end

  def update(conn, %{"id" => id, "document" => document_params}) do
    document = Documentss.get_document!(id)

    with {:ok, %Document{} = document} <- Documentss.update_document(document, document_params) do
      render(conn, "show.json", document: document)
    end
  end

  def delete(conn, %{"id" => id}) do
    document = Documentss.get_document!(id)

    with {:ok, %Document{}} <- Documentss.delete_document(document) do
      send_resp(conn, :no_content, "")
    end
  end
end
