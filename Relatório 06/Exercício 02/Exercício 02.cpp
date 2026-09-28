#include <iostream>
#include <string>

using namespace std;

class LinkSocial {
private:
    string nome;
    string arcana;
    int rank;

public:
    void setNome(string n) {
        nome = n;
    }

    void setArcana(string a) {
        arcana = a;
    }

    void setRank(int r) {
        rank = r;
    }

    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    void subirRank() {
        rank++; 
    }
};

int main() {
    LinkSocial protagonistaLink;

    protagonistaLink.setNome("Ryuji Sakamoto");
    protagonistaLink.setArcana("Chariot");
    protagonistaLink.setRank(1);

    cout << "--- Status do Link Social ---" << endl;
    cout << "Personagem: " << protagonistaLink.getNome() << endl;
    cout << "Arcana: " << protagonistaLink.getArcana() << endl;
    cout << "Rank Atual: " << protagonistaLink.getRank() << endl;

    cout << "\nPassando tempo com " << protagonistaLink.getNome() << "..." << endl;
    protagonistaLink.subirRank();

    cout << "\n--- Rank Up! ---" << endl;
    cout << "Personagem: " << protagonistaLink.getNome() << endl;
    cout << "Arcana: " << protagonistaLink.getArcana() << endl;
    cout << "Novo Rank: " << protagonistaLink.getRank() << endl;

    return 0;
}