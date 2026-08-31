use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    println!("--- Numeros no intervalo terminados em {} ---", digito);

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