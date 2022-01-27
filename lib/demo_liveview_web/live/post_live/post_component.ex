defmodule DemoLiveviewWeb.PostLive.PostComponent do
  use DemoLiveviewWeb, :live_component

  # def mount(socket) do

  # end

  def render(assigns) do
    ~L"""
      <div id="post-<%= @post.id %>" class="post">
        <b>@<%= @post.username %></b>
        <p><%= @post.body %></p>
        <a href="#" phx-click="likes" phx-target="<%= @myself %>">
          Likes(<%= @post.likes %>)
        </a> |
        <a href="#" phx-click="retweets" phx-target="<%= @myself %>">
          Retweet(<%= @post.reposts_count %>)
        </a> |
        <span><%= live_patch "Edit", to: Routes.post_index_path(@socket, :edit, @post) %></span> |
        <span><%= link "Delete", to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure?"] %></span> |
        <hr>
      </div>
    """
  end

  def handle_event("likes", _, socket) do
    DemoLiveview.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
  end

  def handle_event("retweets", _, socket) do
    DemoLiveview.Timeline.inc_retweets(socket.assigns.post)
    {:noreply, socket}
  end
end
