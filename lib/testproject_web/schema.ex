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

    field :get_transporter_by_id, :transporter do
      arg(:id, non_null(:id))
      resolve(fn  _entity, %{id: id}, _context->
        {:ok, Testproject.Transporters.get_transporter!(id)}
      end)
    end
  end


  mutation do
  # this is the mutation entry point to our app
  field :create_transporter, :transporter do
    arg(:input, :transporter_input )
    resolve(fn  _entity, %{input: transporter_params}, _context->
       Testproject.Transporters.create_transporter(transporter_params)
    end)
  end

  field :create_vehicle, :vehicle do
    arg(:input, :vehicle_input )
    resolve(fn  _entity, %{input: vehicle_params}, _context->
       Testproject.Vehicles.create_vehicle(vehicle_params)
    end)
  end



  end


  object :vehicle do
    field :id, :integer
    field :license_plate, :string
    field :status, :string
    end

    input_object :vehicle_input do
      field :id, :integer
      field :license_plate, :string
      field :status, :string
      end

    object :transporter do
      field :id, :integer
      field  :name, :string
      field :phone_number, :string
      field :npwp_number, :string
      field :status, :string
      end

      input_object :transporter_input do
        field  :id, :id
        field  :name, :string
        field :phone_number, :string
        field :npwp_number, :string
        field :status, :string
        end



 end
