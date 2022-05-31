defmodule TestprojectWeb.DocumentView do
  use TestprojectWeb, :view
  alias TestprojectWeb.DocumentView

  def render("index.json", %{document: document}) do
    %{data: render_many(document, DocumentView, "document.json")}
  end

  def render("show.json", %{document: document}) do
    %{data: render_one(document, DocumentView, "document.json")}
  end

  def render("document.json", %{document: document}) do
    %{
      id: document.id,
      id: document.id,
      type: document.type,
      document_url: document.document_url,
      reference_id: document.reference_id,
      reference_table: document.reference_table
    }
  end
end
