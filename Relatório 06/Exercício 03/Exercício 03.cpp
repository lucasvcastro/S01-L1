#include <iostream>
#include <string>

using namespace std;

class MembroInatel {
public:
    string nome;

    void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
    }
};

class Aluno : public MembroInatel {
public:
    string curso;

    void seApresentar() {
        cout << "Meu nome e " << nome << " e estudo no curso de " << curso << "." << endl;
    }
};

class Professor : public MembroInatel {
public:
    string disciplina;

    void seApresentar() {
        cout << "Meu nome e " << nome << " e leciono a disciplina de " << disciplina << "." << endl;
    }
};

int main() {
    Aluno aluno;
    Professor professor;

    aluno.nome = "Lucas Vasconcelos";
    aluno.curso = "Engenharia de Software";

    professor.nome = "Ruan Patrick";
    professor.disciplina = "Paradigmas da Programacao";

    aluno.seApresentar();
    professor.seApresentar();

    return 0;
}