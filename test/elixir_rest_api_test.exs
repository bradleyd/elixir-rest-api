defmodule ElixirRestApiTest do
  use ExUnit.Case
  use Plug.Test

  #@opts ElixirRestApiTest.init([])

  test "returns hello world" do
    conn = conn(:get, "/hello")

    # Invoke the plug
    conn = ElixirRestApi.Router.call(conn, [])

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "world"
  end 
end
