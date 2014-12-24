defmodule ElixirRestApi.Utils do
   def tar(auth_token, file) do
     path = Path.join("/tmp", "#{auth_token}.tar")
     files = [{'Dockerfile', file}]
     :erl_tar.create(String.to_char_list(path), files) 
   end
   
end

