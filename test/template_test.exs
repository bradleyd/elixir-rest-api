defmodule ElixirRestApiTemplateTest do
  use ExUnit.Case
 
  test "bind does not return without correct attributes" do
    assert {:err, _} = ElixirRestApi.Template.bind(%{auth_token: 1234})
  end

  ## need to have better test
  test "bind returns template" do
    assert {:ok, _} = ElixirRestApi.Template.bind(%{ auth_password: "secret", auth_token: "12345", account_uuid: "123-456-789"})
  end
  
  
end
