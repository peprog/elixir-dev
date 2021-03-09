defmodule BlogWeb.TopicView do
  use BlogWeb, :view
  alias BlogWeb.TopicView

  def render("index.json", %{topics: topics}) do
    %{data: render_many(topics, TopicView, "topic.json")}
  end

  def render("show.json", %{topic: topic}) do
    %{data: render_one(topic, TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{id: topic.id,
      title: topic.title,
      description: topic.description,
      posts: render_many(topic.posts, BlogWeb.PostView, "post.json")
    }
  end
end
