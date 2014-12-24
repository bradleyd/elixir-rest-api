defmodule ElixirRestApiParseTest do
  use ExUnit.Case
 
  test "parse" do
    
    data = "{\"bar\": 1}"
    assert %{ :bar => 1 } == ElixirRestApi.Parse.parse(data)
  end
  
end
