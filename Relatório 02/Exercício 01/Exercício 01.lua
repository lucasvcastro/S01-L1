local M = tonumber(io.read())
local N = tonumber(io.read())
local base = tonumber(io.read())

function gerarTabelaPotencias(inicio, fim, base)
    for i = inicio, fim do
        local resultado = base ^ i
        print(base .. " ^ " .. i .. " = " .. resultado)
    end
end

gerarTabelaPotencias(M, N, base)