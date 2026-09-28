# Herança e Polimorfismo em C++

**Eu:** No exercício 3, eu preciso criar as classes Aluno e Professor que herdam de MembroInatel. Como eu indico que uma classe tá herdando da outra? E eu preciso declarar o atributo nome dentro de Aluno e Professor de novo?

**Gemini:** Ótima pergunta! Para indicar herança em C++, você usa dois pontos `:` depois do nome da classe filha, seguido do modificador de acesso (geralmente `public`) e o nome da classe mãe. Fica assim:
```cpp
class Aluno : public MembroInatel {
    // ...
};
```
E a melhor parte da herança é justamente o reuso de código! Você **não** precisa (e nem deve) declarar o atributo `nome` de novo. Como `Aluno` e `Professor` herdam de `MembroInatel`, elas automaticamente já "ganham" o atributo `nome` e o método `seApresentar()`. Você só precisa adicionar os atributos específicos de cada uma, como `curso` no Aluno.

<br>

**Eu:** O exercício pede pra eu "sobrescrever" o método seApresentar() nas classes filhas. Como eu faço isso? 

**Gemini:** Quando você declara um método na classe filha com a *mesma assinatura* (mesmo nome e mesmos parâmetros) de um método que já existe na classe mãe, você está sobrescrevendo ele.
O C++ é inteligente o suficiente para saber qual usar. Se você chamar `seApresentar()` em um objeto do tipo `Aluno`, ele vai executar a versão personalizada que você escreveu dentro da classe `Aluno`, ignorando a versão genérica da classe `MembroInatel`. Para sobrescrever, basta criar o método normalmente na classe filha:
```cpp
void seApresentar() {
    cout << "Meu nome é " << nome << " e estudo no curso de " << curso << "." << endl;
}
```

<br>

**Eu:** E se eu precisar chamar o seApresentar() da classe mãe de dentro da classe filha?

**Gemini:** Se dentro da classe `Aluno` você quisesse usar o comportamento da classe mãe antes de adicionar o seu, você poderia chamar o método usando o operador de resolução de escopo `::`. Ficaria assim: `MembroInatel::seApresentar();`. Isso é muito útil para reaproveitar a lógica original e só adicionar detalhes extras na classe filha.

<br>

# O Que Eu Aprendi

Aprendi a usar herança em C++ colocando : public NomeDaClasseMae na definição da classe, o que me permitiu reutilizar o atributo nome sem precisar reescrever o código nas classes Aluno e Professor. Também aprendi sobre polimorfismo e como criar comportamentos personalizados para o mesmo comando, e como posso usar o operador :: para acessar métodos da classe mãe. 