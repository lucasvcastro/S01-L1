class FichaDeCriatura {
  constructor(criatura, nivelDePerigo) {
    this.criatura = criatura;
    this.nivelDePerigo = nivelDePerigo;
  }

  descrever() {
    return `Criatura: ${this.criatura} | Nivel de perigo: ${this.nivelDePerigo}`;
  }
}

class DiarioMisterioso {
  #fichas = [];

  constructor(numero) {
    this.numero = numero;
  }

  // a ficha e criada dentro do metodo (composicao)
  anotar(criatura, nivelDePerigo) {
    const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
    this.#fichas.push(ficha);
  }

  exibirFichas() {
    console.log(`Diario numero ${this.numero}`);
    this.#fichas.forEach((ficha) => {
      console.log(ficha.descrever());
    });
  }
}

class Funcionario {
  constructor(nome, cargo) {
    this.nome = nome;
    this.cargo = cargo;
  }
}

class CabanaDoMisterio {
  #funcionarios = [];

  constructor(dono) {
    this.dono = dono;
  }

  // o funcionario ja vem pronto de fora (agregacao)
  contratar(funcionario) {
    this.#funcionarios.push(funcionario);
  }

  abrirAsPortas() {
    console.log(`Cabana do Misterio aberta! Dono: ${this.dono}`);
    this.#funcionarios.forEach((funcionario) => {
      console.log(`${funcionario.nome} - ${funcionario.cargo}`);
    });
  }
}

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 'medio');
diario.anotar('Multi-Urso', 'alto');
diario.anotar('Zumbis', 'baixo');
diario.exibirFichas();

console.log('-'.repeat(40));

// funcionarios criados ANTES da Cabana: existem independentemente dela
const soos = new Funcionario('Soos', 'faz-tudo');
const wendy = new Funcionario('Wendy', 'caixa');

const cabana = new CabanaDoMisterio('Tio Stan');
cabana.contratar(soos);
cabana.contratar(wendy);
cabana.abrirAsPortas();

// COMPOSICAO x AGREGACAO neste programa:
// - Composicao: as FichaDeCriatura sao criadas dentro do metodo anotar do
//   DiarioMisterioso (new FichaDeCriatura). Elas pertencem ao diario e so
//   existem nele: se o diario deixar de existir, as fichas vao junto.
//   A dependencia e total.
// - Agregacao: os Funcionario (soos e wendy) sao criados fora e apenas
//   recebidos pelo metodo contratar. A Cabana guarda so uma referencia,
//   entao os funcionarios continuam existindo mesmo sem a Cabana.
//   A ligacao e fraca.