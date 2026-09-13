#include <iostream>
using namespace std;

int main() {
    float carga_max, carga_atual = 0.0;
    int opcao = 0;

    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> carga_max;

    while (opcao != 4) {
        cout << "=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        if (opcao == 1) {
            cout << "Carga Atual: " << carga_atual << " kg / " << carga_max << " kg" << endl;
            cout << "Espaco Disponivel: " << carga_max - carga_atual << " kg" << endl;
        } 
        else if (opcao == 2) {
            float peso;
            cout << "Digite o peso do pacote a ser carregado (kg): ";
            cin >> peso;

            if (carga_atual + peso > carga_max) {
                cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
            } else {
                carga_atual += peso;
                cout << "Pacote adicionado com sucesso!" << endl;
            }
        } 
        else if (opcao == 3) {
            float peso;
            cout << "Digite o peso a ser removido (kg): ";
            cin >> peso;

            if (peso > carga_atual) {
                cout << "Alerta: Impossivel remover mais peso do que o carregado!" << endl;
            } else {
                carga_atual -= peso;
                cout << "Pacote removido com sucesso!" << endl;
            }
        }
    }

    cout << "Encerrando sistema de telemetria..." << endl;

    return 0;
}