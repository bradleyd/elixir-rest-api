defmodule ElixirRestApi.Router do
  import Plug.Conn
  import ElixirRestApi.Parse
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
    {:ok, body, conn} = conn |> read_body
    data = ElixirRestApi.Parse.parse(body)
    IO.inspect data
    send_resp(conn, 200, body)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
