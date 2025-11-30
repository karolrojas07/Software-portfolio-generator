# Helper functions for loading .env files in config files
# This is evaluated at compile time, so we manually parse .env

defmodule ConfigHelpers do
  def load_env_file(path) do
    expanded_path = Path.expand(path)

    if File.exists?(expanded_path) do
      expanded_path
      |> File.read!()
      |> String.split(~r/\r?\n/)
      |> Enum.each(fn line ->
        line = String.trim(line)

        # Skip empty lines and comments
        if line != "" and not String.starts_with?(line, "#") do
          case String.split(line, "=", parts: 2) do
            [key, value] ->
              key = String.trim(key)
              # Remove quotes if present
              value =
                value
                |> String.trim()
                |> String.trim_leading("\"")
                |> String.trim_trailing("\"")
                |> String.trim_leading("'")
                |> String.trim_trailing("'")

              # Set the environment variable
              System.put_env(key, value)
            _ ->
              :ok
          end
        end
      end)
    end
  end
end
