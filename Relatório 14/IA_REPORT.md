# IA_REPORT — Relatório 14 (Prolog · Mundo Ninja)
## Lucas Vasconcelos Castro - GES 747

---

## Conversa 

**Eu:** mano, mandei o pdf e o banco do relatório 14. no exercício 1 ele fala que o boruto foi treinado por sasuke e naruto. como eu escrevo esses fatos? qual ordem vai?

**Claude:** Olha o comentário do banco: `mestre(mestre, discipulo)`. O primeiro argumento é quem ensinou, o segundo é quem aprendeu. Então ficam:

```prolog
mestre(sasuke, boruto).
mestre(naruto, boruto).
```

E coloquei eles junto dos outros `mestre/2`, logo depois de `mestre(naruto, konohamaru).`. Se você jogasse lá no fim do arquivo, separados dos demais, o SWISH avisaria de *discontiguous*, que é aquele erro comum do slide 16.

**Eu:** entendi. aí a regra aprendiz_de_elite, por que tem esses parênteses todos? não dava pra escrever sem?

**Claude:** Dava pra escrever, mas ia significar outra coisa. A regra ficou assim:

```prolog
aprendiz_de_elite(Ninja) :-
    ( mestre(kakashi, Ninja) ; mestre(sasuke, Ninja) ),
    ( natureza(Ninja, raio) ; natureza(Ninja, fogo) ).
```

O ponto é que a vírgula (E) "prende" mais forte que o ponto e vírgula (OU). Sem parênteses, o Prolog leria:

```prolog
mestre(kakashi, N) ; (mestre(sasuke, N), natureza(N, raio)) ; natureza(N, fogo)
```

Ou seja, o último pedaço, `natureza(N, fogo)`, ficaria solto e retornaria qualquer ninja de fogo, mesmo sem ser aluno do Kakashi ou do Sasuke. O enunciado quer "(kakashi OU sasuke) E (raio OU fogo)", então os parênteses é que garantem isso.

**Eu:** faz sentido. mas na query pq o sasuke apareceu duas vezes?

**Claude:** É o comportamento esperado, e o próprio enunciado avisa disso. O Sasuke é aluno do Kakashi e tem duas naturezas, fogo e raio. Cada combinação que dá certo vira uma resposta, então ele sai duas vezes. O resultado é `sasuke`, `sasuke` e `boruto`. Se você quiser sem repetição, dá pra usar `setof/3`:

```prolog
?- setof(Q, aprendiz_de_elite(Q), L).
L = [boruto, sasuke].
```

Mas pro exercício a query simples já resolve.

**Eu:** beleza. exercício 2, ninja versátil. a dica fala pra testar X \= Y. por que não dá só pra contar as naturezas?

**Claude:** No Prolog básico não tem um "contar" simples dentro da regra. Em vez disso a gente pergunta: "existem duas naturezas X e Y, diferentes?". Ficou:

```prolog
ninja_versatil(Ninja) :-
    natureza(Ninja, X),
    natureza(Ninja, Y),
    X \= Y,
    vila(Ninja, konoha).
```

Se o ninja só tem uma natureza, o único jeito de X e Y serem preenchidos é com o mesmo valor, aí o `X \= Y` falha. Se tem duas ou mais, existe pelo menos um par diferente.

**Eu:** por que o `X \= Y` fica depois dos dois natureza? posso pôr antes?

**Claude:** Não pode, e esse é um erro clássico. O `\=` só testa se dois termos **não conseguem unificar**. Se X e Y ainda estiverem sem valor, eles sempre conseguem unificar (uma variável livre encaixa em qualquer coisa), então o `\=` falharia sempre, e a regra nunca daria resposta. Por isso os `natureza(...)` vêm primeiro: eles preenchem X e Y, e só depois a comparação faz sentido. O slide 12 comenta isso do `\+`, e a lógica é a mesma.

**Eu:** show. exercício 3, rivais. o que eu entendi: mesmo mestre, não ser a mesma pessoa e clã diferente. escrevi certo?

**Claude:** Entendeu certo. A regra ficou:

```prolog
rivais(A, B) :-
    mestre(M, A),
    mestre(M, B),
    A \= B,
    cla(A, ClaA),
    cla(B, ClaB),
    ClaA \= ClaB.
```

`mestre(M, A)` e `mestre(M, B)` usam o mesmo `M`, que é o que garante o mesmo mestre. O `A \= B` exclui o ninja de ser rival dele mesmo, já que, sem isso, o Naruto seria "rival" do Naruto. Os dois `\=` vêm depois de A e B já estarem preenchidos, pela mesma razão de antes.

**Eu:** e quem deu de rival do naruto?

**Claude:** `minato` e `sasuke`. O Naruto tem dois mestres no banco: Jiraiya e Kakashi. Dos alunos do Jiraiya, o Minato é de outro clã (namikaze, contra uzumaki), então conta. O Nagato é do mesmo clã uzumaki, então não conta. Dos alunos do Kakashi, o Sasuke é uchiha, então conta.

**Eu:** perai, e a sakura? ela também é aluna do kakashi e não é uzumaki

**Claude:** Boa observação. O problema é que no banco **não existe** nenhum fato `cla(sakura, ...)`. Quando a regra tenta `cla(sakura, ClaB)`, não acha nada e falha, então ela some das respostas. O Prolog trata o que não está na base como falso. Não é erro da regra: é uma limitação dos dados. Se você adicionasse, por exemplo, `cla(sakura, haruno).`, ela passaria a aparecer. Mas o exercício não pede pra alterar isso, então deixei como está e registrei num comentário.

**Eu:** entendi. agora o exercício 4, linhagem.

**Claude:** Vamos por partes. A regra tem duas cláusulas:

```prolog
linhagem(M, D) :- mestre(M, D).
linhagem(M, D) :- mestre(M, Z), linhagem(Z, D).
```

A primeira é o **caso base**: se M é mestre direto de D, acabou. A segunda é o **passo recursivo**: se M é mestre de alguém Z, e esse Z está na linhagem de D, então M também está. Ou seja, a gente "desce" um nível (de M para Z) e faz a mesma pergunta de novo, agora a partir do Z. É igual ao exemplo do slide 14 do caminho até o castelo.

Por exemplo, `linhagem(jiraiya, sasuke)`: o Jiraiya não é mestre direto do Sasuke, então tenta o passo recursivo com Z = minato. Aí `linhagem(minato, sasuke)` tenta Z = kakashi, e `linhagem(kakashi, sasuke)` cai no caso base, porque `mestre(kakashi, sasuke)` existe. Deu verdadeiro.

**Eu:** e se eu esquecer o caso base?

**Claude:** Sem o caso base a recursão nunca termina com sucesso. Ela só sabe descer, nunca sabe "parar com resposta", então acaba esgotando as opções e dando `false`. É o aviso do slide 14: "sem caso base, a recursão nunca termina". Pior ainda é se você escrever a chamada recursiva **antes** do `mestre`, algo como `linhagem(M, D) :- linhagem(Z, D), mestre(M, Z).`. Aí o Prolog chama `linhagem` com Z ainda sem valor, que chama `linhagem` de novo, e fica num loop infinito. Por isso o `mestre(M, Z)` vem primeiro, pra preencher o Z antes de recursar.

**Eu:** posso trocar a ordem das duas cláusulas?

**Claude:** Nesse banco pode, porque não tem ciclos (ninguém é mestre de si mesmo, direta ou indiretamente). O resultado seria o mesmo conjunto, só em outra ordem de saída. Mas por convenção e por segurança, o caso base fica primeiro.

**Eu:** e quem apareceu na linhagem do jiraiya?

**Claude:** 10 pessoas distintas: `minato`, `nagato`, `naruto`, `kakashi`, `obito`, `rin`, `sasuke`, `sakura`, `konohamaru` e `boruto`. Os diretos são Minato, Nagato e Naruto. O resto é indireto: Kakashi, Obito e Rin vêm via Minato; Sasuke e Sakura via Kakashi; Konohamaru e Boruto via Naruto, e o Boruto também via Sasuke. Por isso ele aparece 3 vezes na lista completa, e o Naruto e o Konohamaru aparecem 2 vezes cada. Com `setof(D, linhagem(jiraiya, D), L).` você tem a lista sem repetição.

**Eu:** vc rodou isso tudo no swipl mesmo?

**Claude:** Não, e quero ser claro sobre isso. Não tinha SWI-Prolog disponível, então escrevi um simulador em Python que lê os fatos do `banco_rl14.pl` e executa cada regra na mesma ordem de busca e backtracking do Prolog. Foi assim que conferi os resultados. Nessa conferência eu achei um erro meu: no comentário da Query 4 eu tinha escrito que o Sasuke tinha mais de um caminho até o Jiraiya, e a simulação mostrou que ele só tem um. Corrigi o comentário. Mesmo assim, isso não substitui rodar no SWISH de verdade, então vale você colar o arquivo lá, rodar as 4 queries e comparar.

---

## O que aprendi

Prolog segue o paradigma lógico: em vez de escrever o passo a passo, eu descrevo o que é verdade (fatos e regras) e faço perguntas à base de conhecimento, e o Prolog encontra as respostas por unificação e backtracking. No exercício 1, aprendi a incluir novos fatos em `mestre/2` e a combinar E (`,`) e OU (`;`) numa mesma regra, usando parênteses porque a vírgula tem precedência sobre o ponto e vírgula e, sem eles, a regra mudaria de significado. No exercício 2, vi como verificar "pelo menos duas naturezas" sem contar nada, testando dois valores `X` e `Y` da mesma relação com `X \= Y`, que só funciona depois de as variáveis já estarem preenchidas. No exercício 3, usei a mesma variável `M` em dois `mestre` para garantir o mesmo mestre e entendi que o que não está no banco é falso, o que explica a Sakura não aparecer entre os rivais por não ter `cla/2`. No exercício 4, aprendi a escrever uma regra recursiva com caso base e passo recursivo para percorrer a linhagem, e que as respostas repetidas aparecem porque cada caminho que dá certo vira uma resposta, podendo ser filtradas com `setof/3`.