# IA_REPORT - Relatório 11 (POO com Java)
# Lucas Vasconcelos Castro - GES 747

---

**Eu:** Exercício 1. Qual a diferença de uma classe abstrata pra uma classe normal? O `Morador` precisa mesmo ser `abstract`?

**Claude:** Precisa, porque o enunciado diz que não existe "morador genérico". Marcando a classe como `abstract`, o Java não deixa você fazer `new Morador(...)`. Ela serve só de base pras filhas, que são o `Mago` e o `DemonioDoFogo`.

**Eu:** E o `apresentar()` abstrato, por que não tem corpo?

**Claude:** Método abstrato é só a assinatura, terminada em `;`. É a obrigação que a classe filha herda: toda filha concreta tem que implementar. Se o `Mago` esquecesse de sobrescrever o `apresentar()`, o código nem compilaria.

**Eu:** Pra que serve o `@Override`?

**Claude:** Ele avisa o compilador que você está sobrescrevendo um método do pai. Se você errar o nome ou os parâmetros, tipo `apresentr()`, ele reclama na hora em vez de criar um método novo sem querer. Não é obrigatório, mas é boa prática.

**Eu:** Na main, por que guardar o Mago numa variável do tipo `Morador`?

**Claude:** Isso mostra o polimorfismo. A variável é do tipo `Morador`, mas o objeto é um `Mago`. Quando você chama `apresentar()`, o Java executa a versão do objeto real, não a do tipo da variável. Por isso cada um se apresenta do seu jeito.

**Eu:** O item 5 fala que o erro aparece e o programa nem compila. Que erro é esse?

**Claude:** É o "Morador is abstract; cannot be instantiated". Diferente do Ruby e do JavaScript, o Java descobre isso antes de rodar, na compilação. Depois é só comentar a linha, como o exercício pede.

---

**Eu:** Exercício 2. O `ComboLeblanc` usa `getPreco()` em vez de `preco`. Por quê?

**Claude:** Porque o `preco` é `private` na `ItemDoCardapio`, então a filha não enxerga direto. Ela usa o getter público: `getPreco() * 0.9`. Isso mantém o encapsulamento.

**Eu:** E o `precoFinal()` do pai só retorna o preço?

**Claude:** Isso. O item comum custa o preço cadastrado. O combo sobrescreve pra aplicar 10% de desconto. Na hora de mostrar o cardápio, o `CafeLeblanc` chama `precoFinal()` em todo mundo, e cada item calcula do jeito dele.

**Eu:** Por que o `ArrayList` é declarado como atributo e criado dentro do construtor?

**Claude:** O enunciado pede o cardápio criado vazio no construtor, sem parâmetros. Então o atributo é `private ArrayList<ItemDoCardapio> cardapio;` e dentro do construtor vem `this.cardapio = new ArrayList<>();`. O `<ItemDoCardapio>` garante que só entram itens desse tipo, e como `ComboLeblanc` é filho, ele também entra.

**Eu:** E o `for-each`?

**Claude:** A forma é `for (ItemDoCardapio item : cardapio)`. Lê-se "para cada item no cardápio". Dentro do bloco, o `item` é o elemento da vez. Dá pra usar o `printf` com `%.2f` pra mostrar o preço com duas casas.

---

**Eu:** Exercício 3. Quando uso interface e quando uso classe abstrata? Os dois parecem a mesma coisa.

**Claude:** A interface define só o contrato, sem implementação, e serve pra classes sem relação nenhuma. Aqui o `Alienigena` e o `EspiritoYoukai` não têm nada em comum, só o `manifestar()`. Classe abstrata faz mais sentido quando as filhas compartilham uma base, como o `nome` do `Morador` no Exercício 1.

**Eu:** Qual a diferença entre `extends` e `implements`?

**Claude:** `extends` é pra herdar de uma classe, e `implements` é pra assinar uma interface. Na interface `Sobrenatural` o método é só `void manifestar();`, e cada classe que usa `implements` é obrigada a implementar com `@Override`.

**Eu:** Como funciona o `HashMap<String, Sobrenatural>`?

**Claude:** É um mapa chave-valor. A chave é o nome do local (`String`) e o valor é o ser. Repare que o tipo do valor é a interface, então qualquer coisa que seja `Sobrenatural` entra, seja alienígena ou espírito. Pra guardar você usa `put(local, ser)` e pra buscar `get(local)`.

**Eu:** E se o local não existe no mapa?

**Claude:** O `get` devolve `null`. Por isso o `investigar` faz `if (ser == null)` e imprime que o local está tranquilo. Se não tivesse essa checagem, chamar `manifestar()` num `null` daria `NullPointerException`.

---

**Eu:** Exercício 4. Onde fica a composição e onde fica a agregação?

**Claude:** A `Panela` é criada dentro do construtor do `Cozinheiro` (`new Panela(materialDaPanela)`), então é composição: nasce com ele e depende dele. Os monstros são criados na main, antes do cozinheiro, e entram pelo `adicionarIngrediente`, então é agregação. Eles existem sem o cozinheiro.

**Eu:** O `Slime` e a `Mandragora` precisam de construtor próprio?

**Claude:** Precisam, porque o `Monstro` só tem construtor com `nome`. Em Java, o construtor do pai não é herdado, então cada filha declara o seu e chama `super(nome)`.

**Eu:** No `servirBanquete`, a lista tem `Monstro`, mas chama `receita()` de cada um. Como funciona?

**Claude:** Mesma ideia do polimorfismo do Exercício 1. A lista é de `Monstro`, mas cada objeto é `Slime` ou `Mandragora`. O Java executa a `receita()` do tipo real, então cada monstro responde com o próprio modo de preparo.

---

## O que aprendi

Aprendi que classe abstrata em Java é de verdade: tentar instanciar dá erro de compilação, e o programa nem roda. Entendi a diferença entre `extends` e `implements` e que interface serve pra classes sem relação, enquanto classe abstrata serve pra filhas com base comum. O `@Override` me protege de errar nome de método. Vi o polimorfismo funcionando quando guardo `Mago` e `DemonioDoFogo` em variáveis `Morador`. Treinei coleções com `ArrayList` e `for-each`, e o `HashMap` com `put` e `get`, lembrando que `get` devolve `null` quando a chave não existe. Por fim, a composição aparece quando a classe cria o objeto por dentro, e a agregação quando ela só recebe um objeto pronto.
