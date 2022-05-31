defmodule Testproject.Transporter_vehiclesTest do
  use Testproject.DataCase

  alias Testproject.Transporter_vehicles

  describe "transporter_vehicle" do
    alias Testproject.Transporter_vehicles.Transporter_vehicle

    import Testproject.Transporter_vehiclesFixtures

    @invalid_attrs %{transporter_id: nil, vehicle_id: nil}

    test "list_transporter_vehicle/0 returns all transporter_vehicle" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert Transporter_vehicles.list_transporter_vehicle() == [transporter_vehicle]
    end

    test "get_transporter_vehicle!/1 returns the transporter_vehicle with given id" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert Transporter_vehicles.get_transporter_vehicle!(transporter_vehicle.id) == transporter_vehicle
    end

    test "create_transporter_vehicle/1 with valid data creates a transporter_vehicle" do
      valid_attrs = %{transporter_id: "some transporter_id", vehicle_id: "some vehicle_id"}

      assert {:ok, %Transporter_vehicle{} = transporter_vehicle} = Transporter_vehicles.create_transporter_vehicle(valid_attrs)
      assert transporter_vehicle.transporter_id == "some transporter_id"
      assert transporter_vehicle.vehicle_id == "some vehicle_id"
    end

    test "create_transporter_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transporter_vehicles.create_transporter_vehicle(@invalid_attrs)
    end

    test "update_transporter_vehicle/2 with valid data updates the transporter_vehicle" do
      transporter_vehicle = transporter_vehicle_fixture()
      update_attrs = %{transporter_id: "some updated transporter_id", vehicle_id: "some updated vehicle_id"}

      assert {:ok, %Transporter_vehicle{} = transporter_vehicle} = Transporter_vehicles.update_transporter_vehicle(transporter_vehicle, update_attrs)
      assert transporter_vehicle.transporter_id == "some updated transporter_id"
      assert transporter_vehicle.vehicle_id == "some updated vehicle_id"
    end

    test "update_transporter_vehicle/2 with invalid data returns error changeset" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Transporter_vehicles.update_transporter_vehicle(transporter_vehicle, @invalid_attrs)
      assert transporter_vehicle == Transporter_vehicles.get_transporter_vehicle!(transporter_vehicle.id)
    end

    test "delete_transporter_vehicle/1 deletes the transporter_vehicle" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert {:ok, %Transporter_vehicle{}} = Transporter_vehicles.delete_transporter_vehicle(transporter_vehicle)
      assert_raise Ecto.NoResultsError, fn -> Transporter_vehicles.get_transporter_vehicle!(transporter_vehicle.id) end
    end

    test "change_transporter_vehicle/1 returns a transporter_vehicle changeset" do
      transporter_vehicle = transporter_vehicle_fixture()
      assert %Ecto.Changeset{} = Transporter_vehicles.change_transporter_vehicle(transporter_vehicle)
    end
  end
end
