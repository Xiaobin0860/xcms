defmodule Xcms.ContentTest do
  use Xcms.DataCase

  alias Xcms.Content

  describe "posts" do
    alias Xcms.Content.Post

    @valid_attrs %{body: "some body", cover: "some cover", published: true, slug: "some slug", title: "some title", uid: 42}
    @update_attrs %{body: "some updated body", cover: "some updated cover", published: false, slug: "some updated slug", title: "some updated title", uid: 43}
    @invalid_attrs %{body: nil, cover: nil, published: nil, slug: nil, title: nil, uid: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Content.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Content.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Content.create_post(@valid_attrs)
      assert post.body == "some body"
      assert post.cover == "some cover"
      assert post.published == true
      assert post.slug == "some slug"
      assert post.title == "some title"
      assert post.uid == 42
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Content.update_post(post, @update_attrs)
      assert post.body == "some updated body"
      assert post.cover == "some updated cover"
      assert post.published == false
      assert post.slug == "some updated slug"
      assert post.title == "some updated title"
      assert post.uid == 43
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_post(post, @invalid_attrs)
      assert post == Content.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Content.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Content.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Content.change_post(post)
    end
  end
end
