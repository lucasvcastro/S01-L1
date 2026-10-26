class Pistola {
  constructor(modelo) {
    this.modelo = modelo;
  }
}

class AgenteProtocolo {
  #pistola;

  constructor(codinome, modeloDaPistola) {
    this.codinome = codinome;
    // a pistola e criada aqui dentro (composicao)
    this.#pistola = new Pistola(modeloDaPistola);
  }

  // contrato: as classes filhas devem sobrescrever
  usarHabilidade() {
    throw new Error('Cada agente deve implementar usarHabilidade');
  }

  entrarEmCombate() {
    console.log(`${this.codinome} entra em combate com a pistola ${this.#pistola.modelo}. Habilidade: ${this.usarHabilidade()}`);
  }
}

class Controlador extends AgenteProtocolo {
  usarHabilidade() {
    return 'lanca uma cortina de fumaca para bloquear a visao inimiga';
  }
}

class Iniciador extends AgenteProtocolo {
  usarHabilidade() {
    return 'lanca um drone que revela a posicao dos inimigos';
  }
}

class Duelista extends AgenteProtocolo {
  usarHabilidade() {
    return 'avanca com um impulso rapido para abrir espaco no ataque';
  }
}

class Esquadrao {
  #agentes;

  // os agentes ja chegam prontos (agregacao)
  constructor(nome, agentes) {
    this.nome = nome;
    this.#agentes = agentes;
  }

  iniciarPartida() {
    console.log(`Esquadrao ${this.nome} iniciando a partida!`);
    this.#agentes.forEach((agente) => {
      agente.entrarEmCombate();
    });
  }

  listarControladores() {
    return this.#agentes.filter((agente) => agente instanceof Controlador);
  }
}

const omen = new Controlador('Omen', 'Ghost');
const brimstone = new Controlador('Brimstone', 'Classic');
const sova = new Iniciador('Sova', 'Sheriff');
const jett = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Alfa', [omen, brimstone, sova, jett]);
esquadrao.iniciarPartida();

console.log('Controladores do esquadrao:');
esquadrao.listarControladores().forEach((agente) => {
  console.log(agente.codinome);
});

// Item 8: o objeto e criado normalmente, mas entrarEmCombate chama
// usarHabilidade, que lanca o erro. Linha comentada para voltar a rodar.
const generico = new AgenteProtocolo('Generico', 'Classic');
// generico.entrarEmCombate();