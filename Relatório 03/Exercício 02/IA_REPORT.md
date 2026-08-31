**Usuário:**
O que fiz de errado no meu código? Está dando alguns erros na hora de compilar.

```rust
use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    let resultado = palpite - numero_secreto;

    if resultado < 0 {
        resultado = -resultado;
    }

    resultado <= 5
}

fn main() {
    let numero_secreto: i32 = 67;

    loop {
        let mut palpite = String::new();
        println!("Digite seu palpite: ");
        io::stdin().read_line(&mut palpite).expect("Erro na leitura");

        let palpite_formatado: i32 = palpite.trim().parse().unwrap_or(0.0);

        if acertou_o_alvo(palpite_formatado) {
            println("Parabens, voce acertou o alvo! Voce ficou a apenas {} unidade(s) do numero secreto", resultado);
            break;
        } else {
            println!("Voce passou longe! Tente novamente.\n");
        }
    }
}
```

[Imagem anexada: image_70683e.png]

**Assistente:**
Seu código tem 5 erros de compilação relacionados a imutabilidade, escopo de variáveis, tipos e sintaxe do Rust.

* **Reatribuição imutável (`resultado`):** Na função `acertou_o_alvo`, a variável `resultado` foi criada como imutável com `let`. Para alterar seu valor com `resultado = -resultado`, ela precisaria ser `let mut`. No entanto, em Rust é melhor usar o método `.abs()` para obter o valor absoluto diretamente.
* **Tipo incompatível no `unwrap_or`:** Você colocou `unwrap_or(0.0)`, mas `0.0` é um ponto flutuante (`f64`) e a variável `palpite_formatado` é um inteiro `i32`. O correto é usar `unwrap_or(0)`.
* **Argumento faltando:** A função `acertou_o_alvo` exige dois parâmetros (`palpite` e `numero_secreto`), mas você passou apenas `palpite_formatado`.
* **Macro `println!` sem exclamação:** Faltou a exclamação `!` na chamada do `println`.
* **Variável fora de escopo (`resultado` na `main`):** A variável `resultado` só existia dentro da função `acertou_o_alvo`. Na `main`, você precisa calcular a distância separadamente para exibi-la.

Código corrigido e otimizado:

```rust
use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    // .abs() calcula o valor absoluto da diferença em 1 linha
    (palpite - numero_secreto).abs() <= 5
}

fn main() {
    let numero_secreto: i32 = 67;

    loop {
        let mut palpite = String::new();
        println!("Digite seu palpite: ");
        io::stdin().read_line(&mut palpite).expect("Erro na leitura");

        // Troca de 0.0 por 0 para manter o tipo i32
        let palpite_formatado: i32 = palpite.trim().parse().unwrap_or(0);

        // Passando os dois argumentos necessários
        if acertou_o_alvo(palpite_formatado, numero_secreto) {
            let distancia = (palpite_formatado - numero_secreto).abs();
            
            // Adicionada a exclamação do println! e a variável distancia do escopo local
            println!(
                "Parabens, voce acertou o alvo! Voce ficou a apenas {} unidade(s) do numero secreto",
                distancia
            );
            break;
        } else {
            println!("Voce passou longe! Tente novamente.\n");
        }
    }
}
```
