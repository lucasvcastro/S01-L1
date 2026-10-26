# Lucas Vasconcelos Castro - GES 747

---

**Eu:** Qual a diferença entre o `#vida` e um atributo normal tipo `this.apelido`?

**Claude:** O `#` torna o atributo realmente privado: só dá pra acessar dentro da classe. O `this.apelido` é público e qualquer um lê e altera. Então no `Pokemon`, `apelido` e `tipo` ficam abertos, e a `#vida` só muda por dentro, no `sofrerDano`.

**Eu:** E o getter `vida` sem setter, como fica?

**Claude:** Você cria só o `get vida()` retornando `this.#vida`. De fora você lê com `pokemon.vida`, sem parênteses. Se tentar `pokemon.vida = 100`, nada acontece (ou dá erro em modo estrito), porque não tem setter.

**Eu:** No `sofrerDano`, a vida não pode ficar negativa

**Claude:** Subtrai e depois confere: `this.#vida -= pontos; if (this.#vida < 0) this.#vida = 0;`. Dá pra usar `Math.max(0, ...)` também, mas o `if` fica mais claro. Na main, o Squirtle bate duas vezes no Bulbasaur que começa com 30, então a segunda pancada leva a vida pra 0 em vez de -10. Dá pra ver o limite funcionando.

**Eu:** o item 5 diz que o programa nem roda

**Claude:** Em JavaScript, usar `objeto.#vida` fora da classe é erro de **sintaxe**, não de execução. O Node recusa o arquivo todo antes de rodar qualquer linha. Por isso o exercício manda comentar a linha. Depois de comentar, tudo volta a funcionar.

**Eu:** E nas filhas, por que o `super` vem primeiro no constructor?

**Claude:** Em classes que herdam, você precisa chamar `super(...)` antes de usar `this`. Na `Squirtle`, o constructor recebe só `apelido` e `vidaInicial` e chama `super(apelido, 'Agua', vidaInicial)`, com o tipo fixo.

---

**Eu:** O `usarHabilidade` com `throw new Error` é tipo o `NotImplementedError` do Ruby?

**Claude:** Parecido. JavaScript não tem classe abstrata nativa, então o contrato é o método do pai lançar um erro. Se a filha não sobrescrever, o erro aparece na hora que o método é chamado. A `Controlador`, a `Iniciador` e a `Duelista` sobrescrevem e retornam um texto.

**Eu:** o `new AgenteProtocolo(...)` ta funcionando mas o `entrarEmCombate()` dá erro

**Claude:** Criar o objeto é permitido, porque a classe não é realmente abstrata. O `entrarEmCombate` chama `this.usarHabilidade()`, que no pai só lança o erro. Então o erro só estoura na chamada, e por isso a linha foi comentada no final.

**Eu:** E o `filter` com `instanceof` no `listarControladores`?

**Claude:** O `filter` percorre o array e devolve um novo só com os itens em que a função retorna `true`. O `agente instanceof Controlador` testa se o objeto é dessa classe. Então volta só o Omen e o Brimstone, e na main você percorre o resultado com `forEach`.

---

**Eu:** O `#fichas = []` fora do constructor funciona?

**Claude:** Funciona. Campos de classe podem ser declarados no corpo da classe com valor inicial. Então `#fichas = [];` já cria o array vazio pra cada objeto novo, e o constructor fica só com o `numero`.

**Eu:** no `anotar`, por que criar a ficha lá dentro e não receber pronta?

**Claude:** Porque o exercício quer composição. A ficha só existe dentro do diário, então quem cria é o próprio diário, no método `anotar`. Já na `CabanaDoMisterio`, o `contratar` recebe um `Funcionario` que já existia, que é agregação.

**Eu:** O que eu escrevo no comentário de composição e agregação?

**Claude:** Algo direto: as fichas são composição porque são criadas dentro do `anotar` e dependem do diário. Os funcionários são agregação porque são criados fora e só recebidos pelo `contratar`. Deixei esse comentário no fim do arquivo.

---

**Eu:** Pra que o `aranhas = []` no constructor da Trupe?

**Claude:** É um valor padrão. Se você criar `new TrupeFantasma('Yorknew')` sem passar as aranhas, o parâmetro vira um array vazio e não quebra. Se passar o array, usa o que foi passado.

**Eu:** e o `find`? Qual a diferenca do `filter`?

**Claude:** O `filter` devolve um **array** com todos que passam no teste. O `find` devolve só o **primeiro** que passa, ou `undefined` se ninguém passar. Como cada aranha tem um número único, o `buscarAranha(numero)` com `find` é o ideal.

**Eu:** E o polimorfismo desse exercício, onde aparece?

**Claude:** No array de usuários de Nen. O `forEach` chama `hunter.atacar(alvo)` pra cada um, e cada tipo (`Intensificador`, `Transmutador` e `Materializador`) executa o ataque dele, mesmo o código de chamada sendo igual.

---

## O que aprendi

Aprendi que em JavaScript o `#` cria atributo privado de verdade, e que acessar ele de fora é erro de sintaxe, o que impede o programa de rodar. Entendi que o getter sem setter deixa o valor só pra leitura e que o `super` precisa vir antes do `this` nas classes filhas. Vi que o `throw new Error` faz o papel de classe abstrata, porque o erro só aparece quando o método é chamado. A diferença entre composição e agregação ficou clara pelo lugar onde o objeto é criado: dentro da classe ou fora. Também treinei os métodos de coleção: `forEach` para percorrer, `filter` com `instanceof` para separar por classe e `find` para achar um item só.