class Pokemon {
  // atributo privado: so pode ser acessado dentro da classe
  #vida;

  constructor(apelido, tipo, vidaInicial) {
    this.apelido = apelido;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  // apenas getter, sem setter: de fora a vida so pode ser lida
  get vida() {
    return this.#vida;
  }

  sofrerDano(pontos) {
    this.#vida -= pontos;
    if (this.#vida < 0) {
      this.#vida = 0;
    }
    console.log(`${this.apelido} sofreu ${pontos} de dano e ficou com ${this.#vida} de vida.`);
  }

  atacar(alvo) {
    console.log(`${this.apelido} ataca ${alvo.apelido} com um golpe generico!`);
    alvo.sofrerDano(10);
  }
}

class Squirtle extends Pokemon {
  constructor(apelido, vidaInicial) {
    super(apelido, 'Agua', vidaInicial);
  }

  atacar(alvo) {
    console.log(`${this.apelido} ataca ${alvo.apelido} com Jato de Agua!`);
    alvo.sofrerDano(20);
  }
}

class Bulbasaur extends Pokemon {
  constructor(apelido, vidaInicial) {
    super(apelido, 'Planta', vidaInicial);
  }

  atacar(alvo) {
    console.log(`${this.apelido} ataca ${alvo.apelido} com Chicote de Vinha!`);
    alvo.sofrerDano(15);
  }
}

const squirtle = new Squirtle('Squirtle do Ash', 50);
const bulbasaur = new Bulbasaur('Bulbasaur da Misty', 30);

bulbasaur.atacar(squirtle);
squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur); // a vida do Bulbasaur nao passa de zero

console.log(`Vida do ${squirtle.apelido}: ${squirtle.vida}`);
console.log(`Vida do ${bulbasaur.apelido}: ${bulbasaur.vida}`);

// Item 5: acessar #vida fora da classe gera SyntaxError (campo privado),
// entao o programa nem chega a rodar. Linha comentada para voltar a rodar.
// console.log(squirtle.#vida);