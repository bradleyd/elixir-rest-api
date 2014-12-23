defmodule ElixirRestApiTest do
  use ExUnit.Case
  use Plug.Test

  #@opts ElixirRestApiTest.init([])

  test "returns hello world" do
    conn = conn(:get, "/hello")
    conn = ElixirRestApi.Router.call(conn, [])

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "world"
  end 

  test "returns bar from post foo" do
    conn = conn(:post, "/foo", "{\"baz\": 1}",  headers: [{"content-type", "application/json"}])
    conn = ElixirRestApi.Router.call(conn, [])

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "bar"

  end
  
end
