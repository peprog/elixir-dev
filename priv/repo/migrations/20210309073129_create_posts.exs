defmodule Blog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :text, :text
      add :topic_id, references(:topics, on_delete: :nothing)

      timestamps()
    end

    create index(:posts, [:topic_id])
  end
end
