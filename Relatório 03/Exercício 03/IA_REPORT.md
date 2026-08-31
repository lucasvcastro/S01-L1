**Usuário:**
Como eu crio essa variável já como um número inteiro? Pra não precisar converter depois.

[Imagem anexada: image_70d8a3.png]

**Assistente:**
Em Rust, **não é possível** ler a entrada do teclado diretamente para uma variável de tipo inteiro. A função `io::stdin().read_line()` exige obrigatoriamente um buffer de texto (`&mut String`), pois tudo o que vem do terminal chega como uma sequência de caracteres (incluindo o `
` ao apertar Enter).

Se o seu objetivo é ter uma variável numérica pronta para uso sem manter uma `String` intermediária ocupando o escopo, você pode usar um **bloco de expressão** ou ***shadowing***:

**Opção 1: Bloco de Expressão (A `String` é destruída na hora)**

Você realiza a leitura e conversão dentro de um bloco isolado. A `String` criada temporariamente é descartada assim que a conversão termina:

```rust
use std::io;

fn main() {
    println!("Digite o digito final desejado (0 a 9): ");

    let numero: i32 = {
        let mut entrada = String::new();
        io::stdin().read_line(&mut entrada).expect("Erro na leitura");
        entrada.trim().parse().expect("Digite um número válido")
    };

    // 'numero' é diretamente um i32 e a String de leitura já saiu da memória
}
```

**Opção 2: Shadowing (Reutilizar o nome da variável)**

Lê na `String` e redefini a variável logo em seguida com o tipo `i32`:

```rust
let mut numero = String::new();
io::stdin().read_line(&mut numero).expect("Erro na leitura");

// Sobrescreve 'numero', transformando-o em inteiro
let numero: i32 = numero.trim().parse().expect("Digite um número válido");
```

*(Nota: Na imagem do seu código, atente-se também ao nome da variável: você declarou `let mut numero`, mas passou `&mut entrada` dentro da função `read_line`).*

**Usuário:**
O que tem de errado no código que eu fiz?
use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        if i % 10 == digito {
            println!(i);
        }
    }
}

fn main() {
    println!("Digite o digito final desejado (0 a 9): ");
    
    let mut digito = String::new();
    io::stdin().read_line(&mut digito).expect("Erro na leitura");
    digito.trim().parse().unwrap_or(0);

    println!("Digite o limite inferior: ");
    
    let mut limite_inferior = String::new();
    io::stdin().read_line(&mut limite_inferior).expect("Erro na leitura");
    limite_inferior.trim().parse().unwrap_or(0);

    println!("Digite o limite superior: ");
    
    let mut limite_superior = String::new();
    io::stdin().read_line(&mut limite_superior).expect("Erro na leitura");
    limite_superior.trim().parse().unwrap_or(0);

    imprimir_terminados_em(digito, limite_inferior, limite_superior)
}

[Imagens anexadas: image_70ef0a.png, image_70ef26.png]

**Assistente:**
Seu código possui três problemas principais: sintaxe da macro `println!`, descarte do resultado da conversão para inteiro e a ausência da mensagem de cabeçalho exigida no exemplo.

* **Resultado da conversão descartado (Erro de tipos):** A expressão `digito.trim().parse().unwrap_or(0);` calcula o número `i32`, mas você não atribui o resultado a nenhuma variável. A variável `digito` continua sendo uma `String`. Quando você chama `imprimir_terminados_em(...)`, o compilador acusa erro por receber `String` em vez de `i32`.
* **Sintaxe do `println!`:** O Rust exige a string de formatação com `{}` para imprimir variáveis. Escrever `println!(i);` gera erro de compilação; o correto é `println!("{}", i);`.
* **Falta do cabeçalho da saída:** Na imagem de exemplo, há a impressão do texto `--- Números no intervalo terminados em X ---` antes da exibição dos números.

Código corrigido usando *shadowing* para salvar as conversões diretamente nas variáveis:

```rust
use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    println!("\n--- Números no intervalo terminados em {} ---", digito);

    for i in limite_inferior..=limite_superior {
        if i % 10 == digito {
            println!("{}", i);
        }
    }
}

fn main() {
    println!("Digite o digito final desejado (0 a 9): ");
    let mut digito = String::new();
    io::stdin().read_line(&mut digito).expect("Erro na leitura");
    // Atribui o i32 convertido de volta à variável
    let digito: i32 = digito.trim().parse().unwrap_or(0);

    println!("Digite o limite inferior: ");
    let mut limite_inferior = String::new();
    io::stdin().read_line(&mut limite_inferior).expect("Erro na leitura");
    let limite_inferior: i32 = limite_inferior.trim().parse().unwrap_or(0);

    println!("Digite o limite superior: ");
    let mut limite_superior = String::new();
    io::stdin().read_line(&mut limite_superior).expect("Erro na leitura");
    let limite_superior: i32 = limite_superior.trim().parse().unwrap_or(0);

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}
```

**Usuário:**
Me explica melhor como aquele for imprime os valores corretos

**Assistente:**
O funcionamento desse laço baseia-se em dois conceitos: o **intervalo inclusivo** do Rust e o **operador de resto da divisão (`%`)** da matemática.

**1. O Intervalo Inclusivo (`limite_inferior..=limite_superior`)**
A sintaxe `..=` instrui o Rust a iterar por todos os números inteiros do `limite_inferior` até o `limite_superior`, incluindo o valor final. Se os limites forem `10` e `13`, a variável `i` assumirá em sequência os valores `10`, `11`, `12` e `13`.

**2. A Lógica do Operador de Resto (`% 10`)**
No sistema decimal (base 10), o resto da divisão inteira de qualquer número positivo por 10 é **sempre o seu último dígito**:
* $17 \div 10 = 1$ com **resto 7** $\rightarrow$ `17 % 10` resulta em **7**
* $27 \div 10 = 2$ com **resto 7** $\rightarrow$ `27 % 10` resulta em **7**
* $40 \div 10 = 4$ com **resto 0** $\rightarrow$ `40 % 10` resulta em **0**

**3. A Condição de Filtragem (`if i % 10 == digito`)**
A cada repetição, o programa calcula o último dígito de `i` e compara com o `digito` solicitado. O `println!("{}", i)` só roda se a comparação for verdadeira.

**Passo a passo na prática** (assumindo `limite_inferior = 15`, `limite_superior = 18` e `digito = 7`):

* **Interação 1 (`i = 15`)**: $15 \% 10 = 5$. O resto $5 == 7$? **Falso** $\rightarrow$ ignora.
* **Interação 2 (`i = 16`)**: $16 \% 10 = 6$. O resto $6 == 7$? **Falso** $\rightarrow$ ignora.
* **Interação 3 (`i = 17`)**: $17 \% 10 = 7$. O resto $7 == 7$? **Verdadeiro** $\rightarrow$ executa `println!` e exibe **17**.
* **Interação 4 (`i = 18`)**: $18 \% 10 = 8$. O resto $8 == 7$? **Falso** $\rightarrow$ ignora.

Dessa forma, todos os números fora do padrão desejado são descartados silenciosamente durante a iteração.
