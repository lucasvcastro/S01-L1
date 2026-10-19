# IA_REPORT - Relatório 09 (POO com Ruby)

Conversa com o Claude enquanto resolvia os exercícios.

---

**Eu:** No exercício 1, pra que serve esse `@_preco` sem `attr_reader`? Não era mais fácil só usar `attr_accessor :preco`?

**Claude:** Era mais fácil, mas aí qualquer um mudaria o preço pra qualquer valor, tipo `-50` ou `9999`. O exercício quer que o preço só mude pelo setter, que valida a faixa de 5 a 200. Por isso o `@_preco` fica "escondido" e a gente cria o `preco` e o `preco=` na mão. É o encapsulamento na prática.

**Eu:** E o `initialize` atribui direto no `@_preco`, então o preço inicial não passa pela validação, certo?

**Claude:** Certo. O enunciado manda atribuir direto, então um `CoquetelAfterlife.new("Teste", 1000)` passaria sem reclamar. Se quisesse validar também na criação, era só usar `self.preco = preco` no `initialize`. Aqui seguimos o que foi pedido.

**Eu:** Na `DrinkDeLenda`, por que a `ficha` usa `super` sem parênteses e depois soma uma string?

**Claude:** `super` sem parênteses repassa os mesmos argumentos que o método recebeu. Como `ficha` não recebe nada, ele chama a `ficha` do pai e devolve o texto. Aí é só concatenar com `+ " | Em homenagem a: ..."`. A gente reaproveita o texto do pai sem copiar código.

**Eu:** E o item 6, de tentar mudar o nome? Que erro dá?

**Claude:** Dá `NoMethodError`, tipo "undefined method `nome='". Como só tem `attr_reader`, o setter do nome não existe. Depois de ver o erro, é só comentar a linha com `#`, como o exercício pede.

---

**Eu:** No 2, por que o `Instrumentista.new` funciona mas o `interpretar` dá erro? 

**Claude:** Ruby não tem classe abstrata de verdade. O `raise NotImplementedError` só roda quando o método é chamado. Criar o objeto é permitido, e só quando você chama `interpretar` o erro estoura. É por isso que o enunciado fala pra observar isso e depois comentar a chamada.

**Eu:** Na `Solista` e na `Acompanhador` eu não preciso de `initialize`, né?

**Claude:** Não. Se a classe filha não define `initialize`, ela usa o do pai. Então `Solista.new("Kousei Arima", "piano")` já funciona, e o `nome` e o `instrumento` vêm do `attr_reader` do pai.

**Eu:** Qual a diferença entre `.each` e `.map` no `Regente`?

**Claude:** O `.each` percorre e executa algo pra cada item, mas o retorno não importa. É o caso do `reger`, que só imprime. O `.map` percorre e devolve um **array novo** com o resultado de cada volta. É o caso do `escalacao`, que devolve os textos "Solista - Kousei Arima", e depois você imprime com `.each` na main.

**Eu:** E onde tá o polimorfismo aqui?

**Claude:** No `reger`. Ele chama `instrumentista.interpretar(peca)` pra cada um do array sem saber se é `Solista` ou `Acompanhador`. Cada objeto responde do seu jeito. O `Regente` só precisa que todo mundo tenha o método `interpretar`.

---

**Eu:** No 3, fiquei confuso com composição e agregação. Como eu sei qual é qual no código?

**Claude:** Olha onde o objeto nasce. Se é criado **dentro** da classe, é composição. No `LaboratorioDeGadgets`, o `PhoneWave.new` tá no `initialize`, então o aparelho pertence ao laboratório e só existe nele. Se o objeto é criado **fora** e a classe só recebe, é agregação. Os membros são criados na main e entram pelo `admitir(membro)`, então existem sem o laboratório.

**Eu:** Então se o laboratório sumisse, o PhoneWave sumia junto e os membros não?

**Claude:** Isso. Dependência total no PhoneWave e ligação fraca com os membros. Por isso o enunciado manda criar os membros antes do laboratório na main.

**Eu:** E pra explicar isso no comentário, escrevo o quê?

**Claude:** Algo curto: o `PhoneWave` é composição porque é criado dentro do `initialize` e depende do laboratório. Os `MembroDoLab` são agregação porque são criados fora e só recebidos pelo `admitir`. Eu deixei isso no final do arquivo.

---

**Eu:** No 4, se o `Depoente` já tem `depor` com `raise`, por que eu ainda preciso escrever `depor` nas classes?

**Claude:** Porque o método do módulo é só o "contrato". Se a classe não sobrescrever, ao chamar `depor` cai no `raise NotImplementedError`. Quando a classe define o próprio `depor`, ele passa na frente do método do módulo. É o jeito do Ruby de fazer interface.

**Eu:** E o `Detivel`, como ele sabe o nome da pessoa?

**Claude:** O módulo chama `nome` dentro do `ser_detido`. Quando a classe inclui o módulo, esse `nome` vira o `attr_reader` dela, que vem do `Envolvido`. Por isso o módulo só funciona em classes que têm `nome`.

**Eu:** E o `respond_to?(:ser_detido)` no `select`?

**Claude:** Ele pergunta pro objeto se ele tem o método `ser_detido`. Só o `SuspeitoDoCrime` inclui o `Detivel`, então a testemunha fica de fora. Assim a gente filtra pelo **comportamento**, e não pela classe.

**Eu:** Por que o `SuspeitoDoCrime` tem `initialize` próprio, se o exercício não falou?

**Claude:** Eu coloquei um parâmetro `alibi` pra ele ter um álibi pra contar no `depor`. Ele chama `super(nome)` pra mandar o nome pro `Envolvido`. Se você preferir, dá pra deixar o álibi fixo no texto e remover o `initialize`.

---

## O que aprendi

Aprendi que encapsulamento em Ruby é escolher o que fica exposto: só `attr_reader` impede mudar de fora, e o setter manual deixa validar. Entendi que `super` reaproveita o código do pai e que o `NotImplementedError` simula classe abstrata, porque o erro só aparece quando o método é chamado. No Exercício 3, a diferença entre composição e agregação ficou clara olhando onde o objeto é criado, dentro ou fora da classe. No 4, vi que módulos servem tanto de contrato quanto de comportamento pronto, e que `respond_to?` filtra por comportamento em vez de classe. Também usei `.each` para percorrer e `.map` para gerar um array novo.
