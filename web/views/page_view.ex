defmodule DeployTalk.PageView do
  use DeployTalk.Web, :view

  require Config

  def secret do
    {:ok, value} = Config.get(:deploy_talk, :my_secret, default: "unset")
    {:safe, value}
  end

  def at_runtime do
    {:ok, value} = Config.get(:deploy_talk, :runtime, default: "unset")
    {:safe, value}
  end

end
