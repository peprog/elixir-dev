defmodule BlogWeb.TopicController do
  use BlogWeb, :controller

  alias Blog.Posts
  alias Blog.Posts.Topic

  action_fallback BlogWeb.FallbackController

  def index(conn, _params) do
    topics = Posts.list_topics()
    render(conn, "index.json", topics: topics)
  end

  def create(conn, %{"topic" => topic_params}) do
    with {:ok, %Topic{} = topic} <- Posts.create_topic(topic_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.topic_path(conn, :show, topic))
      |> render("show.json", topic: topic)
    end
  end

  def show(conn, %{"id" => id}) do
    topic = Posts.get_topic!(id)
    render(conn, "show.json", topic: topic)
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    topic = Posts.get_topic!(id)

    with {:ok, %Topic{} = topic} <- Posts.update_topic(topic, topic_params) do
      render(conn, "show.json", topic: topic)
    end
  end

  def delete(conn, %{"id" => id}) do
    topic = Posts.get_topic!(id)

    with {:ok, %Topic{}} <- Posts.delete_topic(topic) do
      send_resp(conn, :no_content, "")
    end
  end
end
