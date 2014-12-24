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
    params = "{\"auth_token\":1, \"auth_password\":\"secret\", \"account_uuid\":\"1234-56789\"}"
    conn = conn(:post, "/foo", params,  headers: [{"content-type", "application/json"}])
    conn = ElixirRestApi.Router.call(conn, [])

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "{\"status\":\"success\"}"

  end
  
end
