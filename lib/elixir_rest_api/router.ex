defmodule ElixirRestApi.Router do
  import Plug.Conn
  import ElixirRestApi.Parse
  import ElixirRestApi.Template
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
    case ElixirRestApi.Template.bind(data) do
      {:ok, str} ->
        {:ok, resp} = Poison.encode(%{ status: "success"})
        send_resp(conn, 200, resp)
      {:err, msg} ->
        send_resp(conn, 401, msg)
    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
