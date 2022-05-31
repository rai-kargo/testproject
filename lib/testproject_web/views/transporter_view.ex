defmodule TestprojectWeb.TransporterView do
  use TestprojectWeb, :view
  alias TestprojectWeb.TransporterView

  def render("index.json", %{transporters: transporters}) do
    %{data: render_many(transporters, TransporterView, "transporter.json")}
  end

  def render("show.json", %{transporter: transporter}) do
    %{data: render_one(transporter, TransporterView, "transporter.json")}
  end

  def render("transporter.json", %{transporter: transporter}) do
    %{
      id: transporter.id,
      id: transporter.id,
      name: transporter.name,
      phone_number: transporter.phone_number,
      npwp_number: transporter.npwp_number,
      status: transporter.status
    }
  end
end
