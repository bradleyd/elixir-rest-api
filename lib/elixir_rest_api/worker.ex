defmodule ElixirRestApi.Worker do
  use GenServer
  import ElixirRestApi.Template

  defmodule Results do
    defstruct count: 0    
  end
  
  def start(state \\ []) do
    GenServer.start_link(__MODULE__, state, [{:name, __MODULE__}])
  end

  #def init([]) do
    #{ :ok, %Results{}} 
  #end
  
  def run(pid) do
    # build template
    # build tar
    # build image
    # create container
    # start container
  end
  
  def bind_template(data) do
    GenServer.call(__MODULE__, {:template, data})    
  end
  
  def handle_call({:template, data}, _from, []) do
    case ElixirRestApi.Template.bind(data) do
      {:ok, str } ->
        {:reply, {:ok, str}, []}
      {:err, msg} ->
        {:reply, {:err, msg}, []}
    end
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item|state]}
  end

end

