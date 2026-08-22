**Usuário:**
Como represento uma potência em Lua?

**Gemini:**
Em Lua, você representa uma potência usando o operador circunflexo (**`^`**).

Aqui está como você pode usá-lo na prática:

```lua
-- 2 elevado a 3 (2³)
local resultado = 2 ^ 3
print(resultado) -- Saída: 8.0
```

O operador `^` é bastante flexível e também funciona para raízes e expoentes negativos:

```lua
local quadrado = 5 ^ 2        -- 25.0
local raiz_quadrada = 9 ^ 0.5 -- 3.0 (elevar a 0.5 equivale à raiz quadrada)
local inverso = 2 ^ -1        -- 0.5
```

> **Nota sobre versões:** Em versões antigas (Lua 5.2 e anteriores), existia a função `math.pow(base, expoente)`. No entanto, ela foi removida a partir do Lua 5.3. O uso do operador `^` é a forma padrão, mais rápida e recomendada em qualquer versão da linguagem.

**Usuário:**
Nesse código, como fazer minha função entender que inicio = M e fim = N, de acordo com os inputs recebidos?

local M = tonumber(io.read())
local N = tonumber(io.read())
local base = tonumber(io.read())

function gerarTabelaPotencias(inicio, fim, base)
    for i = inicio, fim do
        local resultado = base ^ i
        print(base .. " ^ " .. i .. " = " .. resultado)
    end
end

**Gemini:**
Para que a sua função entenda que `inicio` deve ser o valor de `M` e `fim` deve ser o valor de `N`, você precisa **chamar a função** passando essas variáveis na exata ordem que você definiu. 

Em Lua (e na maioria das linguagens de programação), a correspondência é feita pela **posição** dos argumentos na hora em que você executa a função.

Aqui está o código completo com a chamada da função no final:

```lua
local M = tonumber(io.read())
local N = tonumber(io.read())
local base = tonumber(io.read())

function gerarTabelaPotencias(inicio, fim, base)
    for i = inicio, fim do
        local resultado = base ^ i
        print(base .. " ^ " .. i .. " = " .. resultado)
    end
end

-- É aqui que a mágica acontece: você CHAMA a função passando as variáveis
gerarTabelaPotencias(M, N, base)
```

### Como isso funciona?

Quando você escreve `gerarTabelaPotencias(M, N, base)`, o Lua faz o seguinte mapeamento automático baseado na ordem:

1. O **1º valor** que você passou (`M`) é jogado na **1ª variável** da função (`inicio`).
2. O **2º valor** que você passou (`N`) é jogado na **2ª variável** da função (`fim`).
3. O **3º valor** que você passou (`base`) é jogado na **3ª variável** da função (`base`).

> Os nomes das variáveis de fora (`M`, `N`) não precisam ser iguais aos nomes das variáveis de dentro da função (`inicio`, `fim`). A linguagem se importa apenas com a **ordem** em que eles são entregues.