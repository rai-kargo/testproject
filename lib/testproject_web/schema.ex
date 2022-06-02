defmodule TestprojectWeb.Schema do
  # required to make a module graphQL Schema
  use Absinthe.Schema

  # this is the resolver that will be used

  query do
  # this is the query entry point to our app
    field :get_vehicle_by_id, :vehicle do
      arg(:id, non_null(:id))
      resolve(fn  _entity, %{id: id}, _context->
        {:ok, Testproject.Vehicles.get_vehicle!(id)}
      end)
    end
  end
  # mutation do
  # # this is the mutation entry point to our app
  # end


  object :vehicle do
    field :id, :integer
    field :license_plate, :string
    field :status, :string
    end


 end
