class Main {
    public static void main(String[] args) {
        Morador howl = new Mago("Howl", "Feitico de Transformacao");
        Morador calcifer = new DemonioDoFogo("Calcifer");

        howl.apresentar();
        calcifer.apresentar();

        // Item 5: Morador e abstrata e nao pode ser instanciada. O erro aparece
        // na COMPILACAO ("Morador is abstract; cannot be instantiated"), entao o
        // programa nem chega a rodar. Linha comentada para voltar a rodar.
        // Morador generico = new Morador("Fulano");
    }
}

abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("Eu sou o mago " + getNome() + " e meu feitico e " + feitico + ".");
    }
}

class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Eu sou o demonio do fogo " + getNome() + " e faco o castelo andar.");
    }
}
