# Conversa com o Claude: exercícios de POO com Python

## Exercício 1 — Dark Souls

**Eu:** Opa, to travado no exercicio 1. Como faço pra criar atributo privado e protegido no python?

**Claude:** É só pelo prefixo no nome:

```python
self.nome = nome     # público
self._almas = almas  # protegido (um underscore)
self.__estus = 0     # privado (dois underscores)
```

O protegido é só convenção, o Python deixa acessar. O privado o Python renomeia por dentro pra `_MortoVivo__estus`, por isso dá erro se você tentar acessar `__estus` de fora.

---

**Eu:** e como faço o setter que só aceita de 0 a 10?

**Claude:** Um `if` com comparação encadeada. Se estiver fora da faixa, mostra a mensagem e não mexe no valor:

```python
def set_estus(self, quantidade):
    if 0 <= quantidade <= 10:
        self.__estus = quantidade
    else:
        print("Quantidade de Estus inválida!")
```

---

**Eu:** Como faço o __init__ ja respeitar essa regra também?

**Claude:** Inicializa o `__estus` com 0 e chama o próprio setter dentro do `__init__`:

```python
def __init__(self, nome, almas, estus):
    self.nome = nome
    self._almas = almas
    self.__estus = 0
    self.set_estus(estus)
```

Assim ninguém consegue criar um morto-vivo com 50 Estus.

---

**Eu:** E o `mostrar_status()`? como faço aquele texto com os três dados?

**Claude:** Com f-string, usando o `__estus` direto (dentro da própria classe pode):

```python
def mostrar_status(self):
    return f"Mortovivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"
```

---

**Eu:** como faço o Clerigo herdar tudo isso e ter o milagre?

**Claude:** Passa `MortoVivo` entre parênteses e chama o `super().__init__(...)` pra inicializar a parte do pai:

```python
class Clerigo(MortoVivo):
    def __init__(self, nome, almas, estus, milagre):
        super().__init__(nome, almas, estus)
        self.milagre = milagre
```

---

**Eu:** e como faço pra sobrescrever o `mostrar_status()` sem copiar o código do pai?

**Claude:** Chama o do pai com `super()` e só acrescenta o que é do filho:

```python
def mostrar_status(self):
    return f"{super().mostrar_status()} | Milagre: {self.milagre}"
```

---

**Eu:** e aquele negócio de imprimir o `__estus` no main e dar erro? como faço?

**Claude:** Escreve `print(clerigo.__estus)`, roda e vai aparecer:

```
AttributeError: 'Clerigo' object has no attribute '__estus'
```

Depois comenta a linha com `#`. Se quiser pegar o valor de fora, usa `clerigo.get_estus()`.

---

## Exercício 2 — Overwatch

**Eu:** exercício 2: Como faço as filhas sem `__init__` próprio e mesmo assim receber codinome e funçao?

**Claude:** É só não escrever o `__init__` nelas. O Python usa o da classe mãe automaticamente:

```python
class HeroiTanque(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} usa a suprema do tanque!")
```

E `HeroiTanque("Reinhardt", "Tanque")` já funciona.

---

**Eu:** como faço a lista com um herói de cada classe?

**Claude:** Com a anotação `list[HeroiOverwatch]`, já que as duas filhas contam como `HeroiOverwatch`:

```python
herois: list[HeroiOverwatch] = [
    HeroiTanque("Reinhardt", "Tanque"),
    HeroiSuporte("Mercy", "Suporte"),
]
```

---

**Eu:** e como faço pra chamar o `curar_equipe()` só nos suportes?

**Claude:** Usa `isinstance` dentro do `for`:

```python
for heroi in herois:
    heroi.usar_suprema()
    if isinstance(heroi, HeroiSuporte):
        heroi.curar_equipe()
```

Sem esse `if`, quando chegasse no tanque ia dar `AttributeError`, porque ele não tem esse método.

---

## Exercício 3 — Persona 5

**Eu:** No 3, como faço a Persona ser criada dentro do Lider?

**Claude:** Instancia ela direto no `__init__` do `Lider`. Isso é a composição:

```python
class Lider:
    def __init__(self, codinome):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")
        self._equipe = []
```

---

**Eu:** e o `recrutar`? como faço ele adicionar o aliado na equipe?

**Claude:** `append` na lista:

```python
def recrutar(self, aliado: Aliado):
    self._equipe.append(aliado)
```

---

**Eu:** como faço o `infiltrar` listar a equipe?

**Claude:** Mostra o palácio, invoca a persona e percorre a `_equipe` com um `for`:

```python
def infiltrar(self, palacio):
    print(f"{self.codinome} e sua equipe invadiram o Palácio de {palacio}!")
    self.persona.invocar()
    print("Equipe:")
    for aliado in self._equipe:
        print(f" - {aliado.codinome} ({aliado.nome})")
```

---

**Eu:** O enunciado manda chamar `infiltrar("")` com as aspas vazias. coloco o que ali?

**Claude:** O nome do dono do Palácio. O próprio enunciado cita o exemplo, então `joker.infiltrar("Kamoshida")`.

---

**Eu:** como faço no main pra criar os aliados antes do líder?

**Claude:** Cria os aliados primeiro, depois o líder, e recruta:

```python
ryuji = Aliado("Ryuji Sakamoto", "Skull")
ann = Aliado("Ann Takamaki", "Panther")

joker = Lider("Joker")
joker.recrutar(ryuji)
joker.recrutar(ann)
joker.infiltrar("Kamoshida")
```

---

**Eu:** e o comentário explicando composiçao e agregaçao, como faço?

**Claude:** Algo assim no fim do código:

```python
# COMPOSIÇÃO: a Persona é criada dentro do __init__ do Lider. Ela só existe
# enquanto o Joker existir.
# AGREGAÇÃO: os Aliados são criados fora e só recebidos em recrutar().
# Eles já existiam antes e continuam existindo se o Lider sumir.
```

---

## Exercício 4 — Cyberpunk

**Eu:** Exercício 4, como faço a interface no python? não tem `interface` na linguagem né

**Claude:** Não tem. Usa uma classe abstrata com o módulo `abc`:

```python
from abc import ABC, abstractmethod

class IUnidadeDeRede(ABC):
    @abstractmethod
    def executar_invasao(self):
        pass
```

---

**Eu:** Como faço o Netrunner criar o Cyberdeck dentro dele?

**Claude:** Igual na Persona do exercício 3. Instancia dentro do `__init__`:

```python
class OperadorNetrunner(IUnidadeDeRede):
    def __init__(self, nome, modelo_cyberdeck):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(f"Netrunner {self.nome} usa o cyberdeck {self.cyberdeck.modelo} "
              f"para quebrar o gelo (ICE) de um servidor.")
```

---

**Eu:** e a `CelulaHacker`? como faço ela aceitar uma lista de unidades?

**Claude:** Recebe a lista pronta no `__init__`, anotada com a interface, e no `iniciar_ataque` percorre chamando o método de cada um:

```python
class CelulaHacker:
    def __init__(self, nome, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self.membros = membros

    def iniciar_ataque(self):
        print(f"Célula {self.nome} iniciando ataque!")
        for membro in self.membros:
            membro.executar_invasao()
```

Não importa se é netrunner ou drone, cada um executa do seu jeito.

---

**Eu:** como faço no main pra juntar os dois na célula?

**Claude:**

```python
netrunner = OperadorNetrunner("V", "Militech Paraline")
drone = DroneDeVigilancia("DRN-077")

celula = CelulaHacker("Voodoo Boys", [netrunner, drone])
celula.iniciar_ataque()
```

---

**Eu:** e aquela parte de criar a interface direto pra ver o erro? como faço?

**Claude:** Escreve `unidade = IUnidadeDeRede()` e roda. Vai aparecer:

```
TypeError: Can't instantiate abstract class IUnidadeDeRede without an implementation for abstract method 'executar_invasao'
```

Depois coloca um `#` na frente da linha pro programa voltar a rodar.

---

## O que eu aprendi 

1. Como criar atributos público, protegido (`_`) e privado (`__`) e como o Python trata cada um.
2. Como fazer getter e setter com validação e usar o setter dentro do `__init__`.
3. Como usar `super().__init__()` e `super().método()` para herdar e sobrescrever sem repetir código.
4. Como montar uma lista da classe mãe com objetos de classes filhas e usar `isinstance` pra chamar métodos exclusivos.
5. A diferença na prática entre composição (objeto criado dentro da classe) e agregação (objeto recebido de fora).
6. Como criar uma interface em Python com `ABC` e `@abstractmethod`, e por que ela não pode ser instanciada.
7. Como usar polimorfismo percorrendo uma lista de objetos e chamando o mesmo método em todos.
