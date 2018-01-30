defmodule Discuss.Plugs.SetUser do
  import Plug.Conn # contains functions for working with the conn object
  import Phoenix.Controller # imported in this case for session manipulation

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
    # this is a great place to do computationally expensive operations. It's only called on the initial spin up of the server code, so you can do a huge query, or a process images here, and it will only happen once, then be automatically passed to the call function below
  end

  def call(conn, _params) do
    # the params object, the second argument to the call function, is always whatever is returned from the init() function of a Module Plug
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
        # conn.assigns.user => User struct
      true ->
        assign(conn, :user, nil)
    end
  end
end