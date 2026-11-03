import java.util.HashMap;

class Main {
    public static void main(String[] args) {
        Alienigena serpo = new Alienigena("Serpo");
        EspiritoYoukai turbo = new EspiritoYoukai("Turbo Vovo");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Tunel Abandonado", turbo);
        mapa.registrar("Hospital Antigo", serpo);

        mapa.investigar("Tunel Abandonado");
        mapa.investigar("Hospital Antigo");
        mapa.investigar("Praca Central"); // local nao registrado
    }
}

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " surge de uma nave e tenta abduzir quem esta investigando!");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " aparece correndo na escuridao e assusta todo mundo!");
    }
}

class MapaDeAvistamentos {
    // chave: nome do local
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println(local + ": o local esta tranquilo.");
        } else {
            System.out.println("Investigando " + local + "...");
            ser.manifestar();
        }
    }
}
