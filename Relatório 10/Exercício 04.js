class UsuarioDeNen {
  constructor(nome) {
    this.nome = nome;
  }

  atacar(alvo) {
    console.log(`${this.nome} lanca um ataque de aura contra ${alvo.nome}!`);
  }
}

class Intensificador extends UsuarioDeNen {
  atacar(alvo) {
    console.log(`${this.nome} reforca o punho com aura e acerta ${alvo.nome} com um soco devastador!`);
  }
}

class Transmutador extends UsuarioDeNen {
  atacar(alvo) {
    console.log(`${this.nome} transforma a aura em eletricidade e descarrega em ${alvo.nome}!`);
  }
}

class Materializador extends UsuarioDeNen {
  atacar(alvo) {
    console.log(`${this.nome} materializa uma arma de aura e ataca ${alvo.nome}!`);
  }
}

class Aranha {
  constructor(nome, numero) {
    this.nome = nome;
    this.numero = numero;
  }
}

class TrupeFantasma {
  #aranhas;

  // as aranhas ja chegam prontas (agregacao)
  constructor(cidade, aranhas = []) {
    this.cidade = cidade;
    this.#aranhas = aranhas;
  }

  revelarAranhas() {
    console.log(`Trupe Fantasma avistada em ${this.cidade}:`);
    this.#aranhas.forEach((aranha) => {
      console.log(`Numero ${aranha.numero} - ${aranha.nome}`);
    });
  }

  buscarAranha(numero) {
    return this.#aranhas.find((aranha) => aranha.numero === numero);
  }
}

// aranhas criadas ANTES da Trupe
const feitan = new Aranha('Feitan', 2);
const nobunaga = new Aranha('Nobunaga', 6);

const trupe = new TrupeFantasma('Yorknew', [feitan, nobunaga]);
trupe.revelarAranhas();

const alvo = trupe.buscarAranha(6);

console.log('-'.repeat(40));

const hunters = [
  new Intensificador('Gon'),
  new Transmutador('Killua'),
  new Materializador('Kite')
];

hunters.forEach((hunter) => {
  hunter.atacar(alvo);
});