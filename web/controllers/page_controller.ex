defmodule DeployTalk.PageController do
  use DeployTalk.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
