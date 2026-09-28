# Encapsulamento em C++

**Eu:** No exercício 2, o enunciado pede para colocar alguns atributos como privados. Como eu coloco os valores neles lá dentro da main depois?

**Gemini:** Se você tentar fazer `aliado.nome = "Ryuji"` na `main`, o C++ vai dar erro. É aí que entra o conceito de Encapsulamento. Para proteger os dados, nós os deixamos como `private`, e então criamos "portas de acesso" públicas (`public`). Essas portas são os métodos **getters** e **setters**.
Os *setters* (como `setNome`) servem para você enviar um valor de fora para dentro da classe. Os *getters* (como `getNome`) servem para você ler o que está lá dentro. Exemplo de como fica na classe:
```cpp
private:
    string nome;
public:
    void setNome(string n) { nome = n; }
    string getNome() { return nome; }
```

<br>

**Eu:** E o método subirRank()? Ele precisa receber algum parâmetro igual no exercício 1?

**Gemini:** Boa observação! Diferente do exercício 1, onde precisávamos interagir com uma banda "rival" que vinha de fora, o `subirRank()` só altera a própria classe onde ele está. 
Como o método pertence ao `LinkSocial`, ele já tem acesso direto e livre ao atributo `rank` daquele personagem específico, mesmo o atributo sendo `private`. Então ele não precisa receber nenhum parâmetro, você só precisa criar um método vazio `void subirRank()` e colocar um `rank++;` dentro dele.

# O Que Eu Aprendi

Entendi como usar o modificador "private" para proteger os dados da minha classe, aplicando o conceito de encapsulamento. Para interagir com esses atributos na main, aprendi a criar e utilizar os métodos "Getters"(para ler a informação) e "Setters" (para definir um valor na variável). Também vi que os métodos da própria classe podem alterar atributos privados diretamente (como no subirRank), sem precisar de getters ou setters internamente.