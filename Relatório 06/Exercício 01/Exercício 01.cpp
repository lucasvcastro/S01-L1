#include <iostream>
#include <string>

using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda& rival) {
        cout << "Apresentacao confirmada! A banda " << nome << " lancou o seu som contra a banda " << rival.nome << "!" << endl;
        
        rival.energia -= potenciaSom; 
    }
};

int main() {
    Banda banda1;
    Banda banda2;

    banda1.nome = "Os Lusitanos";
    banda1.integrantes = 4;
    banda1.potenciaSom = 35.5;
    banda1.energia = 100;

    banda2.nome = "Ventos do Norte";
    banda2.integrantes = 5;
    banda2.potenciaSom = 25.0;
    banda2.energia = 90;

    cout << "--- Antes do Duelo ---" << endl;
    cout << banda1.nome << " | Energia: " << banda1.energia << endl;
    cout << banda2.nome << " | Energia: " << banda2.energia << "\n" << endl;

    banda1.duelar(banda2);

    cout << "\n--- Status apos o confronto ---" << endl;
    cout << "Banda: " << banda1.nome << " | Energia: " << banda1.energia << endl;
    cout << "Banda: " << banda2.nome << " | Energia: " << banda2.energia << endl;

    return 0;
}