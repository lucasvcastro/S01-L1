print("Digite o primeiro número: ")
local n1 = tonumber(io.read())
print("Digite o segundo número: ")
local n2 = tonumber(io.read())

function calcularMedia(a, b)
    return (a + b) / 2
end

function encontrarMaior(a, b)
    if a > b then
        return a
    else
        return b
    end
end

function calcularDiferencaAbsoluta(a, b)
    local diferenca = a - b
    if diferenca < 0 then
        return -diferenca
    else
        return diferenca
    end
end

print("Digite a operação: ")
local operacao = io.read()

function analisarNumeros(n1, n2, operacao)
    if operacao == "media" then
        return calcularMedia(n1, n2)
    elseif operacao == "maior" then
        return encontrarMaior(n1, n2)
    elseif operacao == "diferenca" then
        return calcularDiferencaAbsoluta(n1, n2)
    else
        print("Operação inválida!")
    end
end 

local resultado = analisarNumeros(n1, n2, operacao)

if resultado then
    print(resultado)
end