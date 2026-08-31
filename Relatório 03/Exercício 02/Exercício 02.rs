use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    let mut resultado = palpite - numero_secreto;

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

        let palpite_formatado: i32 = palpite.trim().parse().unwrap_or(0);

        if acertou_o_alvo(palpite_formatado, numero_secreto) {
            let distancia = (palpite_formatado - numero_secreto).abs();
            println!("Parabens, voce acertou o alvo! Voce ficou a apenas {} unidade(s) do numero secreto (67).", distancia);
            break;
        } else {
            println!("Voce passou longe! Tente novamente.\n");
        }
    }
}