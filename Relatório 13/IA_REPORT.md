# IA_REPORT - Relatório 13
# Lucas Vasconcelos Castro - GES 747

---

**Eu:** No exercício 1, ele pede pra criar o `defstruct dominio` com os campos `nome`, `elemento`, `dificuldade` e `mora`. O que esse `defstruct` cria sozinho pra gente?

**Gemini:** Fala! Tranquilo, o `defstruct` é um baita atalho do Common Lisp pra criar estruturas de dados (parecido com `struct` em C ou `record` em Haskell). Só com essa linha `(defstruct dominio nome elemento dificuldade mora)`, o Lisp já gera automaticamente pra você:
- **Construtor:** `make-dominio`, onde você passa os valores usando palavras-chave (`:nome`, `:elemento`, etc.).
- **Getters:** `dominio-nome`, `dominio-elemento`, `dominio-dificuldade` e `dominio-mora` pra ler cada campo.
- **Copiador:** `copy-dominio`, que clona a estrutura (que a gente vai usar lá no último item).
- **Predicado:** `dominio-p`, pra testar se uma variável qualquer é do tipo `dominio`.

**Eu:** Entendi. E no `bonus-elemental`, por que os elementos têm dois-pontos na frente, tipo `:electro` e `:hydro`?

**Gemini:** Esses caras com `:` na frente são **keywords** em Lisp. Diferente de uma variável comum que o Lisp tenta avaliar pra achar um valor guardado, uma keyword sempre avalia pra ela mesma e é única na memória. Por isso elas são perfeitas pra usar dentro do `case` como se fossem um `enum`, sem precisar ficar comparando texto com `string=`. O `otherwise` no final funciona igual ao `default` do switch em outras linguagens, pegando qualquer outro elemento e devolvendo `1`.

---

**Eu:** Beleza, agora no exercício 2, na função `recompensa-final`, é só multiplicar mesmo?

**Gemini:** Isso aí! Como o `defstruct` já criou os getters pra você, o `recompensa-final` só pega `(dominio-mora d)` e multiplica pelo resultado de `(bonus-elemental (dominio-elemento d))`. Bem direto ao ponto, sem mistério.

---

**Eu:** Na função `rota`, qual a diferença de usar `let*` em vez de `let` normal?

**Gemini:** A diferença é a ordem em que as variáveis locais enxergam umas às outras. No `let` comum, todas as variáveis são criadas "ao mesmo tempo", então uma não consegue usar o valor da outra dentro do mesmo bloco. Já o `let*` (com asterisco) avalia em sequência, de cima pra baixo. Como `textos` precisa usar a lista `acessiveis` que acabou de ser filtrada na linha anterior, o `let*` é obrigatório.

**Eu:** E dentro desse `let*` tem `remove-if-not` e `mapcar` usando `lambda`. Como eles funcionam juntos?

**Gemini:** É o combo clássico de filtrar e transformar listas:
1. O `remove-if-not` funciona igual ao `filter`: ele passa cada domínio `d` na `lambda` e mantém só os que têm dificuldade menor ou igual à `dificuldade-maxima`.
2. O `mapcar` é o `map` do Lisp: ele pega essa lista já filtrada (`acessiveis`) e aplica a segunda `lambda` em cada item, usando `(format nil ...)` pra montar a string formatada sem imprimir na tela ainda (`nil` faz o `format` retornar uma string em vez de jogar no console).

---

**Eu:** Agora no exercício 4, na `main`, eu crio a lista de domínios e chamo a `rota` com dificuldade 3. Pq tem um `~%` no `format`?

**Gemini:** Em Common Lisp, o `format` não usa `\n` pra quebrar linha igual em C ou Python — ele usa `~%`. E repara que aqui na `main` o primeiro argumento é `t` (`(format t ...)`), o que diz pro Lisp imprimir direto no terminal, diferente do `nil` que você usou lá na `rota` só pra gerar a string na memória. O `dolist` vai percorrendo cada texto devolvido pela `rota` e imprimindo um por linha.

---

## O que aprendi

Lisp mistura bastante coisa de programação funcional com recursos imperativos. No exercício 1, aprendi a criar estruturas de dados completas de forma rápida com `defstruct`, que já gera construtor, getters e função de cópia automaticamente, além de usar keywords (`:electro`, `:hydro`) com `case`. Nos exercícios 2 e 3, vi como acessar os campos da struct e a importância do `let*` para encadear variáveis locais que dependem umas das outras, usando `remove-if-not` e `mapcar` com `lambda`.
