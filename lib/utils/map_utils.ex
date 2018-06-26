defmodule MapUtils do
    
    def keys_to_atom(string_key_map) do
        for {key, val} <- string_key_map, into: %{}, do: {String.to_atom(key), val}
    end

end