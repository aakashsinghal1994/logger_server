defmodule Helper do
  require Logger

  def start_link do
    port = Application.get_env(:logger_server, :port)
    Task.start_link(fn -> serve_request(port) end)
  end

  defp serve_request(port) do
    {:ok, socket} = :gen_tcp.listen(port,[:binary, packet: :line, active: false, reuseaddr: true])
    Logger.info "Accepting connection on port #{port}"
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    Logger.info "about to accept connection now for socket"
    {:ok, client} = :gen_tcp.accept(socket)
    Logger.info "connection successfully accepted"
    spawn_link(fn -> serve(client) end)
    Logger.info "connection successfully served"
    loop_acceptor(socket)
    Logger.info "acceptor started again"
  end

  defp serve(socket) do
    socket_data = socket |> read_line()
    case socket_data do
      {:ok, data} ->
          data |> write_line(socket)
          serve(socket)
      {:error, _reason} -> Logger.info "Connection closed by user."
    end
  end

  defp read_line(socket) do
    :gen_tcp.recv(socket, 0)
  end

  defp write_line(line, _socket) do
    File.write(Path.expand("~/logs") , line, [:append])
  end

end
