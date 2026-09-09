# Resolução de Exercício em Go (Golang)

---

## Função: `gerarEscalaPlantao(n int)`

### Pergunta
**Usuário:** Me explica melhor o funcionamento de como deve ser essa função, e como fazer em Go

> **Enunciado da Imagem:**  
> Crie uma função chamada `func gerarEscalaPlantao(n int)`.  
> - Um sistema de TI precisa organizar uma escala de plantão técnico que ocorre a cada 4 dias, iniciando no dia 1 do mês.  
> - A função deve receber a quantidade de plantões desejada (`n int`) e usar um laço `for` para calcular e exibir os dias do mês em que os plantões acontecerão (ex: 1º plantão no Dia 1, 2º plantão no Dia 5, 3º plantão no Dia 9, e assim por diante).

---

### Resposta

A função precisa gerar uma sequência numérica que começa no **Dia 1** e avança de **4 em 4 dias**, repetindo o processo exatamente $n$ vezes através de um laço `for`.

#### Como a lógica funciona

* **Dia inicial:** O primeiro plantão ocorre no **Dia 1**.
* **Incremento:** Cada novo plantão acontece 4 dias após o anterior ($1 \rightarrow 5 \rightarrow 9 \rightarrow 13 \dots$).
* **Laço de repetição (`for`):** O loop roda de $1$ até $n$. A cada volta, ele imprime a mensagem com o número do plantão e o dia atual, e em seguida soma $4$ à variável que guarda o dia.

#### Código em Go

```go
package main

import "fmt"

func gerarEscalaPlantao(n int) {
	dia := 1 // Primeiro plantão começa no dia 1

	for i := 1; i <= n; i++ {
		fmt.Printf("%dº plantão no Dia %d\n", i, dia)
		dia += 4 // Avança 4 dias para o próximo plantão
	}
}

func main() {
	// Exemplo de teste gerando 5 plantões
	gerarEscalaPlantao(5)
}
```

#### Saída ao executar

```text
1º plantão no Dia 1
2º plantão no Dia 5
3º plantão no Dia 9
4º plantão no Dia 13
5º plantão no Dia 17
```