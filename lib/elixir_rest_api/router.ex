defmodule ElixirRestApi.Router do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  def call(conn, opts) do
    super(conn, opts)
  end

  get "/hello" do
    send_resp(conn, 200, "world")
  end

  post "/foo" do
    {:ok, body, conn} = read_body(conn)
    data = Poison.decode!(body)
    IO.inspect data
    send_resp(conn, 200, "bar")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end