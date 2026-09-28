#include <iostream>
#include <string>
#include <vector>

using namespace std;

class Hobbit {
public:
    string nome;

    virtual void fazerAtividade() {
        cout << "O hobbit " << nome << " esta aproveitando um dia tranquilo na Comarca." << endl;
    }
};

class Jardineiro : public Hobbit {
public:
    void fazerAtividade() override {
        cout << "O jardineiro " << nome << " esta cuidando das flores e plantas ao redor das tocas!" << endl;
    }
};

class Cozinheiro : public Hobbit {
public:
    void fazerAtividade() override {
        cout << "O cozinheiro " << nome << " esta preparando o segundo cafe da manha para os convidados!" << endl;
    }
};

class Fazendeiro : public Hobbit {
public:
    void fazerAtividade() override {
        cout << "O fazendeiro " << nome << " esta colhendo vegetais e hortalicas em suas terras!" << endl;
    }
};

int main() {
    vector<Hobbit*> comarca;

    Jardineiro jardineiro;
    jardineiro.nome = "Plants";

    Cozinheiro cozinheiro;
    cozinheiro.nome = "Ratatouille";

    Fazendeiro fazendeiro;
    fazendeiro.nome = "Bob";

    comarca.push_back(&jardineiro);
    comarca.push_back(&cozinheiro);
    comarca.push_back(&fazendeiro);

    for (int i = 0; i < comarca.size(); i++) {
        comarca[i]->fazerAtividade();
    }

    return 0;
}