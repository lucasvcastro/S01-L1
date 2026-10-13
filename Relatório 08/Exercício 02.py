class HeroiOverwatch:
    def __init__(self, codinome, funcao):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} ({self.funcao}) usa uma suprema genérica!")


class HeroiTanque(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} ({self.funcao}) usa a suprema: cria uma barreira e protege o time!")


class HeroiSuporte(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} ({self.funcao}) usa a suprema: amplifica o dano e a cura do time!")

    def curar_equipe(self):
        print(f"{self.codinome} está curando a equipe!")


if __name__ == "__main__":
    herois: list[HeroiOverwatch] = [
        HeroiTanque("Reinhardt", "Tanque"),
        HeroiSuporte("Mercy", "Suporte"),
    ]

    for heroi in herois:
        heroi.usar_suprema()                 # polimorfismo
        if isinstance(heroi, HeroiSuporte):  # metodo exclusivo so para suportes
            heroi.curar_equipe()
