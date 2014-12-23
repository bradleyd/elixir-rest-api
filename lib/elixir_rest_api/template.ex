defmodule ElixirRestApi.Template do
  
  @filename "dockerfile.eex"

  def bind(%{ auth_password: password, auth_token: token, account_uuid: uuid}=args) do
    EEx.eval_file Path.join(Path.expand("./templates"), @filename), Map.to_list(args)
  end

  def bind(%{}) do
    {:err, "Replacement parameters needed"}
  end
 
end

