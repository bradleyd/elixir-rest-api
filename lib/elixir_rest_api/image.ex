defmodule ElixirRestApi.Image do
   def dockerfile(auth_token) when is_binary(auth_token) do
     Path.join("/tmp/", auth_token <> ".tar")
   end
end

