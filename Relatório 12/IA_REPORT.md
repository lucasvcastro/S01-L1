# IA_REPORT - Relatório 12
# Lucas Vasconcelos Castro - GES 747

---

**Eu:** No exercício 1 ele pede o tipo `Cafe` com "campos posicionais". oq eh isso?

**Claude:** Fala! Tranquilo, é mais simples do que parece. Posicional é quando você não dá nome pros campos, só a ordem e o tipo: `data Cafe = Cafe String Double Int`. Aí a ordem é nome, preço e intensidade, e pra pegar cada um você usa pattern matching, tipo `descrever (Cafe nome preco _)`. O `_` é pra campo que você não vai usar.

**Eu:** Entendi. E pq o `descrever` tem q usar `show` no preço?

**Claude:** Porque o `++` só junta texto com texto. O preço é `Double`, então se você fizer `nome ++ preco` o GHC reclama do tipo. Com `show preco` o número vira `String` e aí funciona. Esse é um dos erros mais comuns que o slide mostra.

**Eu:** No `forca` ele manda usar guards. Qual a vantagem de guards em vez de if?

**Claude:** Quando tem mais de duas opções, guards ficam bem mais limpos. O `if` só tem dois caminhos e pra três faixas você ia ter que aninhar um dentro do outro. Nos guards ele testa de cima pra baixo e usa o primeiro que der certo. Por isso o `>= 8` vem primeiro, depois o `>= 5` (que na prática pega o 5, 6 e 7 pq o 8+ já saiu), e o `otherwise` fica com o resto.

**Eu:** E o `precoDoPedido` com `if`... ta certo ter `else` obrigatório?

**Claude:** Tá sim. Em Haskell o `if` é uma expressão, ou seja, ele sempre tem q devolver um valor. Se não tivesse o `else`, o que ele devolveria quando a condição fosse falsa? Por isso é obrigatório. Aqui fica `if comLeite then preco + 2.0 else preco`.

**Eu:** E como eu leio `Bool -> Cafe -> Double`?

**Claude:** Lê assim: recebe um `Bool`, recebe um `Cafe` e devolve um `Double`. O último tipo é sempre o retorno, o resto são os argumentos. Na chamada fica `precoDoPedido True cafe`, sem vírgula e sem parênteses.

---

**Eu:** Exercício 2. Aqui o `pesoMaximo` tem q ser definido de novo pra dar erro. Pq dá erro? Em outras linguagens eu so troco o valor.

**Claude:** Aí é a imutabilidade, que é a base do Haskell. `pesoMaximo = 10.0` não é uma atribuição, é uma **definição**: ele é 10.0 pra sempre. Se você escrever `pesoMaximo = 15.0` logo embaixo, o compilador acusa definição duplicada e o programa nem chega a rodar. Depois você comenta a linha com `--`, como o exercício pede.

**Eu:** Ta, e a diferença de `record` pra aquele posicional do exercício 1?

**Claude:** No record você dá nome pros campos, tipo `destinatario :: String`, e o Haskell cria sozinho as funções pra ler cada um. Aí em vez de pattern matching você faz `destinatario e`, `peso e`, `frete e`. Fica bem mais legível quando tem vários campos.

**Eu:** No `cabemNaVassoura` ele fala em lambda. Como q funciona?

**Claude:** Lambda é uma função sem nome escrita ali no meio da expressão. Aqui é `\e -> peso e <= pesoMaximo`, que quer dizer "dado um `e`, devolve se o peso dele é menor ou igual ao máximo". O `filter` chama essa função pra cada encomenda e só deixa passar as que deram `True`. A lista original não muda, ele devolve uma nova.

**Eu:** E o `totalDeFretes` com `map` e `sum`?

**Claude:** O `map frete encomendas` transforma a lista de encomendas numa lista só com os fretes, tipo `[12.0, 25.0, 8.0]`. Depois o `sum` soma tudo e devolve um número só. Dá pra ler de dentro pra fora: `sum (map frete encomendas)`.

---

**Eu:** Exercício 3. Pq o `esbocoMaisRecente` precisa dos dois casos, `[]` e `(e:_)`?

**Claude:** Porque toda lista é ou vazia ou "um elemento na frente do resto". Se você só tratasse o `(e:_)`, uma lista vazia quebrava o programa. Tratando o `[]` você devolve o aviso de caderno vazio. É o jeito seguro de fazer o que o `head` faria.

**Eu:** E a recursão do `contarEsbocos`? Eu nunca fiz sem `for`, mano.

**Claude:** Pensa assim: o caderno vazio tem 0 esboços (caso base). Um caderno com algo tem 1 esboço mais a contagem do resto (caso recursivo). Fica `contarEsbocos (_:xs) = 1 + contarEsbocos xs`. Ele vai chamando a si mesmo com a lista cada vez menor até chegar no `[]`, que devolve 0, e aí soma tudo de volta. O `horasDesenhando` é a mesma ideia, só que em vez de somar 1 ele soma `horas e`.

**Eu:** Entendi. E o item 6, do caderno novo com `:`?

**Claude:** O `:` coloca um elemento na frente e **cria uma lista nova**. Então `cadernoNovo = esbocoNovo : caderno` deixa o `caderno` intacto. Na main você imprime os dois e vê que o anterior continua com 3 esboços e o novo tem 4. É a imutabilidade na prática.

**Eu:** E o `head` de lista vazia? Aquele erro dá na hora de compilar tb?

**Claude:** Não, esse é diferente do erro do exercício 2. O código **compila** normal, mas quebra na hora que roda, com algo tipo "empty list". Por isso o exercício fala "observe o erro ao executar". Depois é só comentar a linha.

---

**Eu:** Último, exercício 4. O `deriving (Show, Eq)` no `Etapa`, pra q serve?

**Claude:** Sem ele o Haskell não sabe fazer duas coisas com o seu tipo novo. O `Show` deixa você converter com `show` pra mostrar (por isso o `show (etapa a)` no `descrever`). O `Eq` deixa você comparar com `==`, que é o q o `arrecadado` precisa. Sem o `Eq`, o `etapa a == Concluido` dá erro de tipo.

**Eu:** E o `concluir`, como ele "altera" o atendimento se nada muda?

**Claude:** Ele não altera. Ele devolve uma **cópia** com a etapa trocada: `a { etapa = Concluido }`. O atendimento original continua do jeito que estava. Por isso na main a lista original continua com os três atendimentos sem concluir, e a nova tem alguns concluídos.

**Eu:** Entao no `arrecadado` da lista original vai dar zero, certo?

**Claude:** Isso, pq nenhum tá concluído e o `filter` não deixa passar ninguém. Aí o `map valor` vira lista vazia e o `sum` de lista vazia é 0. Na lista nova, só os atendimentos que passaram pelo `concluir` entram na soma.

---

## O que aprendi

Haskell foi bem diferente do que eu tava acostumado. O principal foi a imutabilidade: nada é alterado, quando preciso "mudar" algo eu crio um valor novo (com `:` na lista ou `{ etapa = ... }` no record) e o original continua igual. Aprendi que `if` é expressão e por isso precisa do `else`, e que guards ficam melhores quando tem mais de duas opções. Treinei pattern matching com `[]`, `(x:xs)` e `_`, e entendi a recursão pensando em caso base e caso recursivo, sem usar `for`. Também usei `map`, `filter` e lambda pra transformar listas, e vi que o `deriving (Show, Eq)` é o que deixa o tipo ser mostrado e comparado. Por fim, vi a diferença entre erro de compilação (redefinir `pesoMaximo`) e erro de execução (`head []`).