# Conversa sobre Programação em Go (Golang)

---

## 1. Contagem de Caracteres em uma String

### Pergunta
**Usuário:** Como verificar a quantidade de caracteres de um texto em Go?

### Resposta
Para contar a quantidade real de **caracteres (runas)** em uma string em Go — e não o número de bytes —, o método recomendado é a função `utf8.RuneCountInString` do pacote `unicode/utf8`.

```go
package main

import (
	"fmt"
	"unicode/utf8"
)

func main() {
	texto := "Olá, mundo! 🚀"

	// Forma correta: conta caracteres/runas UTF-8
	totalCaracteres := utf8.RuneCountInString(texto)

	// Cuidado: conta apenas o número de bytes
	totalBytes := len(texto)

	fmt.Println("Caracteres:", totalCaracteres) // Retorna 13
	fmt.Println("Bytes:", totalBytes)           // Retorna 18
}
```

#### Diferença entre as abordagens
* **`utf8.RuneCountInString(s)` (Recomendado):** Percorre a string codificada em UTF-8 e conta as runas (caracteres Unicode) sem realizar alocações de memória adicionais. É a opção mais performática para contagem precisa.
* **`len([]rune(s))`:** Converte a string para um slice de runas e mede o tamanho. Entrega o resultado correto de caracteres, mas força uma cópia da string na memória, tornando-se ineficiente para textos longos.
* **`len(s)`:** Retorna apenas a quantidade de **bytes**. Só coincide com o número de caracteres se o texto contiver estritamente caracteres ASCII básicos (sem acentos, cedilha ou emojis, que ocupam múltiplos bytes cada).

---

## 2. Diferenças entre `fmt.Print`, `fmt.Println` e `fmt.Printf`

### Pergunta
**Usuário:** Qual a diferença de usar Printf, Println e Print em Go?

### Resposta
A diferença principal entre as funções do pacote `fmt` está na adição automática de **quebras de linha**, **espaçamento entre argumentos** e na capacidade de **formatação com placeholders**.

| Função | Quebra de linha no final? | Espaço entre argumentos? | Suporta placeholders (`%s`, `%d`)? |
|---|---|---|---|
| **`fmt.Print`** | Não | Apenas se nenhum for string | Não |
| **`fmt.Println`** | **Sim** | **Sim** (sempre) | Não |
| **`fmt.Printf`** | Não | Não (depende do formato) | **Sim** |

#### Detalhamento de cada função
* **`fmt.Print`:** Imprime os valores lado a lado na mesma linha. Se você passar duas strings consecutivas, ela **não** coloca espaço entre elas.
* **`fmt.Println`:** O "ln" vem de *line*. Adiciona sempre um espaço entre os argumentos e uma quebra de linha (`\n`) automaticamente ao final da execução.
* **`fmt.Printf`:** O "f" vem de *formatted*. Permite formatar valores usando especificadores (conhecidos como *verbos*, como `%s` para strings, `%d` para inteiros e `%v` para qualquer valor).

#### Exemplo prático

```go
package main

import "fmt"

func main() {
	nome := "Ana"
	idade := 25

	// 1. fmt.Print: Junta tudo na mesma linha, sem espaço entre strings
	fmt.Print("Nome:", nome, "Idade:", idade)
	// Saída: Nome:AnaIdade: 25 (sem quebra de linha no final)

	fmt.Print("\n---\n")

	// 2. fmt.Println: Adiciona espaço entre os argumentos e quebra a linha
	fmt.Println("Nome:", nome, "Idade:", idade)
	// Saída: Nome: Ana Idade: 25\n

	// 3. fmt.Printf: Usa placeholders para montar a frase e precisa de \n manual
	fmt.Printf("Nome: %s | Idade: %d\n", nome, idade)
	// Saída: Nome: Ana | Idade: 25\n
}
```

---

## 3. Laços de Repetição Atenderem a uma Condição (`for`)

### Pergunta
**Usuário:** Se eu quisesse rodar um loop até uma certa condição se tornar verdadeira, como eu faria?

### Resposta
Em Go, a única palavra-chave para repetição é o `for`. Para rodar um loop **até que** uma condição seja verdadeira, você pode usar uma verificação condicional na declaração do `for` ou um loop infinito com `break`.

#### 1. Loop condicional (checa ANTES de executar)
Ideal para rodar enquanto a condição for falsa (ou seja, até ela se tornar verdadeira):

```go
package main

import "fmt"

func main() {
	contador := 0

	// Roda ATÉ contador atingir ou ultrapassar 5
	for !(contador >= 5) { // Também poderia ser simplesmente: for contador < 5
		fmt.Println("Processando:", contador)
		contador++
	}
}
```

#### 2. Loop infinito com `break` (checa DEPOIS de executar)
Garante que o código interno rode ao menos uma vez (semelhante ao `do-while` de outras linguagens):

```go
package main

import (
	"fmt"
	"math/rand"
)

func main() {
	for {
		numero := rand.Intn(10)
		fmt.Println("Número gerado:", numero)

		// Parada: interrompe o loop assim que a condição for verdadeira
		if numero == 7 {
			fmt.Println("Encontrou o 7! Parando loop.")
			break
		}
	}
}
```

#### Resumo da escolha
* Use `for !condicao` quando você já sabe o estado inicial e a verificação deve ocorrer antes da primeira execução.
* Use `for { ... if condicao { break } }` quando a condição depende de um valor gerado ou processado dentro do próprio bloco do loop.