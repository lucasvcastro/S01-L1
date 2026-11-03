import java.util.ArrayList;

class Main {
    public static void main(String[] args) {
        // monstros criados ANTES do cozinheiro: existem independentemente dele
        Slime slime = new Slime("Slime Verde");
        Mandragora mandragora = new Mandragora("Mandragora Gritona");

        Cozinheiro senshi = new Cozinheiro("Senshi", "ferro");
        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        senshi.servirBanquete();

        // COMPOSICAO x AGREGACAO neste programa:
        // - Composicao: a Panela e criada dentro do construtor do Cozinheiro
        //   (new Panela(materialDaPanela)). Ela pertence ao cozinheiro e nasce
        //   com ele: se o cozinheiro deixar de existir, a panela vai junto.
        //   A dependencia e total.
        // - Agregacao: os Monstros (slime e mandragora) sao criados fora e
        //   apenas recebidos pelo metodo adicionarIngrediente. O cozinheiro
        //   guarda so uma referencia, entao os monstros continuam existindo
        //   mesmo sem ele. A ligacao e fraca.
    }
}

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "gelatina cozida em fogo baixo com um fio de mel";
    }
}

class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "frita em tempura com sal e ervas";
    }
}

class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("Cozinheiro " + nome + " com a panela de " + panela.getMaterial());
        for (Monstro monstro : ingredientes) {
            System.out.println(monstro.getNome() + ": " + monstro.receita());
        }
    }
}
