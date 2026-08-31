use std::io;

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 {
    let mut npt = (prova1 + prova2) / 2.0;
    let mut pf = (0.6 * npt) + (0.4 * redacao);

    if pf >= 60.0 {
        println!("Parabens! Candidato aprovado no processo seletivo. Pontuacao Final: {}", pf);
    } else {
        println!("Infelizmente o candidato nao atingiu a pontuacao minima de aprovacao. Pontuacao Final: {}", pf);
    }

    pf
}

fn main() {
    println!("Digite a nota da Prova Teorica 1: ");
    
    let mut prova1 = String::new();
    io::stdin().read_line(&mut prova1).expect("Erro na leitura");
    let prova1: f64 = prova1.trim().parse().unwrap_or(0.0);

    println!("Digite a nota da Prova Teorica 2: ");
    
    let mut prova2 = String::new();
    io::stdin().read_line(&mut prova2).expect("Erro na leitura");
    let prova2: f64 = prova2.trim().parse().unwrap_or(0.0);

    println!("Digite a nota da Redacao: ");
    
    let mut redacao = String::new();
    io::stdin().read_line(&mut redacao).expect("Erro na leitura");
    let redacao: f64 = redacao.trim().parse().unwrap_or(0.0);

    let pontuacao_final = calcular_pontuacao(prova1, prova2, redacao);
}