class Persona:
    def __init__(self, nome, arcano):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona invocada: {self.nome} | Arcano: {self.arcano}")


class Aliado:
    def __init__(self, nome, codinome):
        self.nome = nome          # nome real
        self.codinome = codinome


class Lider:
    def __init__(self, codinome):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")  # criada DENTRO do __init__
        self._equipe = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)

    def infiltrar(self, palacio):
        print(f"{self.codinome} e sua equipe invadiram o Palácio de {palacio}!")
        self.persona.invocar()
        print("Equipe:")
        for aliado in self._equipe:
            print(f" - {aliado.codinome} ({aliado.nome})")


if __name__ == "__main__":
    # Aliados criados ANTES do líder (existem de forma independente)
    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")
    joker.recrutar(ryuji)
    joker.recrutar(ann)
    joker.infiltrar("Kamoshida")

    # COMPOSIÇÃO: a Persona é criada dentro do __init__ do Lider. Ela pertence
    # ao Joker e só existe enquanto ele existir (se o Lider for destruído, a
    # Persona vai junto). Relação forte "todo-parte".
    #
    # AGREGAÇÃO: os Aliados são criados fora do Lider e apenas recebidos em
    # recrutar(). Já existiam antes e continuam existindo se o Lider sumir.
    # Relação fraca "tem um".
