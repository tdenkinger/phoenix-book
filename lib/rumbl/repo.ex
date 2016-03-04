defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl

  @moduledoc """
  In-memory repositor
  """
  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "Troy Denkinger", username: "troy", password: "testtest"},
     %Rumbl.User{id: "2", name: "Thumbs T. Cat",  username: "thumbs", password: "testtest"},
     %Rumbl.User{id: "3", name: "Stache T. Cat",  username: "stache", password: "testtest"}]
  end

  def all(_), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
