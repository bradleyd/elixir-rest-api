defmodule ElixirRestApi.Router do
  import Plug.Conn
  import ElixirRestApi.Parse
  import ElixirRestApi.Template
  import ElixirRestApi.Utils
  use Plug.Router

  plug :match
  plug :dispatch

  def call(conn, opts) do
    super(conn, opts)
  end

  get "/hello" do
    send_resp(conn, 200, "world")
  end

  post "/foo" do
    {:ok, body, conn} = conn |> read_body
    data = ElixirRestApi.Parse.parse(body)
    IO.inspect data
    #probably should put this in gen sever
    case ElixirRestApi.Template.bind(data) do
      {:ok, str} ->
        # {:ok, pid} = ElixirRestApi.Worker.start(%{template: str, data: data})
        # ElixirRestApi.Worker.run(pid)
        :ok = ElixirRestApi.Utils.tar(data[:auth_token], str) #create tar from template
        ##XXX this could all be in a separate process (Task or Spawn)
        #for each docker host set the docker_url
        #and then build image from dockerfile template
        #:docker_image.build(TarBin, Args)
        #After build gets image id and then 
        #:docker_container.create(image_id)
        # Then start container
        #:docker_container.start(container_id, ports)
        {:ok, resp} = Poison.encode(%{ status: "success"})
        send_resp(conn, 200, resp)
      {:err, msg} ->
        send_resp(conn, 401, msg)
    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
