defmodule PhxToml.Repo.Migrations.CreateE2eMarker do
  use Ecto.Migration

  def change do
    create table(:e2e_markers) do
      add :note, :string
      timestamps()
    end
  end
end
