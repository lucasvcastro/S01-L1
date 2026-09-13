#include <iostream>
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {
    float resultado = 1;
    for (int i = 0; i < tamanho; i++) {
        resultado = resultado * probabilidades[i];
    }
    return resultado;
}

int main() {
    int n;
    float probabilidades[n];

    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n;

    for (int i = 0; i < n; i++) {
        cout << "Digite a probabilidade do componente " << i + 1 << ": ";
        cin >> probabilidades[i];
    }

    float confiabilidade = calcular_confiabilidade_sistema(probabilidades, n);

    cout << "Confiabilidade total do sistema: " << confiabilidade << " (" << confiabilidade * 100 << "%)";

    return 0;
}