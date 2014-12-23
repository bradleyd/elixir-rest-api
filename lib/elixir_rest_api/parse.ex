defmodule ElixirRestApi.Parse do
  
  def parse(body) do
    Poison.decode!(body)   
  end
  
end

