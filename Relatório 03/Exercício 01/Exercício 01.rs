use std::io;

fn validar_placa(placa: &str) -> bool {
    let mut maiusculas = 0;
    let mut numeros = 0;

    for c in placa.chars() {
        if c.is_ascii_uppercase() {
            maiusculas += 1;
        } else if c.is_numeric() {
            numeros += 1;
        }
    }

    placa.len() >= 7 && maiusculas >= 4 && numeros >= 2
}

fn main() {
    loop {
        let mut placa = String::new(); 
        
        println!("Digite a placa do veiculo: ");
        io::stdin().read_line(&mut placa).expect("Erro na leitura");

        let placa_formatada = placa.trim();

        if validar_placa(placa_formatada) {
            println!("Placa cadastrada no sistema!");
            break; 
        } else {
            println!("Placa invalida. Tente novamente.\n");
        }
    }
}