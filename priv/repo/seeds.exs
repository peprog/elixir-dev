# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Blog.Repo

Repo.insert! %Blog.Accounts.User {
  email: "farid@gmail.com",
  name: "farid"
}

Repo.insert! %Blog.Accounts.User {
  email: "masoud@gmail.com",
  name: "masoud"
}

Repo.insert! %Blog.Posts.Topic {
  title: "Topic1 for user1",
  description: "test description for test1 post",
  user_id: 1
}

Repo.insert! %Blog.Posts.Topic {
  title: "Topic2 for user2",
  description: "test description for test1 post",
  user_id: 2
}

Repo.insert! %Blog.Posts.Post {
  title: "Post1 for topic1",
  text: "test description for post1 of topic1",
  topic_id: 1
}

Repo.insert! %Blog.Posts.Post {
  title: "Post1 for topic2",
  text: "test description for post1 of topic2",
  topic_id: 2
}

Repo.insert! %Blog.Posts.Post {
  title: "Post2 for topic1",
  text: "test description for post2 of topic1",
  topic_id: 1
}