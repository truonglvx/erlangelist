defmodule Erlangelist.OldPostController do
  use Erlangelist.Web, :controller

  alias Erlangelist.ArticleEvent

  def render(%{private: %{article: article}} = conn, _params) do
    ArticleEvent.visited(article, %{remote_ip: remote_ip_string(conn)})
    redirect(conn, external: "http://theerlangelist.blogspot.com#{article.redirect}")
  end

  defp remote_ip_string(conn) do
    conn.remote_ip
    |> Tuple.to_list
    |> Enum.join(".")
  end
end
