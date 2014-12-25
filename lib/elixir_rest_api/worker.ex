defmodule ElixirRestApi.Worker do
  use GenServer
  
  def start(state \\ []) do
    {:ok, pid} = GenServer.start_link(__MODULE__, state)
  end

  def handle_call(:pop, _from, [h|t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item|state]}
  end 
  
  def run(message) do

  end

end

