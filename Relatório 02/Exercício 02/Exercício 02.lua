print("Digite a quantidade de elementos: ")
local N = tonumber(io.read())
local tabela = {}

for i = 1, N do
    print("Digite o elemento " .. i .. ": ")
    tabela[i] = tonumber(io.read())
end

print("Digite o número X a ser buscado: ")
local X = tonumber(io.read())

function contarOcorrencias(tabela, alvo)
    local soma = 0
    for i = 1, N do
        if tabela[i] == alvo then
            soma = soma + 1
        end
    end
    return soma
end

local resultado = contarOcorrencias(tabela, X)

if resultado ~= 0 then
    print("O número " .. X .. " aparece " .. resultado .. " vez(es) na tabela")
else
    print("O número " .. X .. " não aparece nenhuma vez na tabela")
end