defmodule ElixirRestApi.Parse do
  
  def parse(body) do
    Poison.decode!(body, keys: :atoms)   
  end
  
end

