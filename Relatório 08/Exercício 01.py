class MortoVivo:
    def __init__(self, nome, almas, estus):
        self.nome = nome          # publico
        self._almas = almas       # protegido 
        self.__estus = 0          # privado 
        self.set_estus(estus)     # reaproveita a validacao do setter

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus inválida!")

    def mostrar_status(self):
        return f"Mortovivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"

class Clerigo(MortoVivo):
    def __init__(self, nome, almas, estus, milagre):
        super().__init__(nome, almas, estus)
        self.milagre = milagre    # atributo exclusivo

    def mostrar_status(self):
        return f"{super().mostrar_status()} | Milagre: {self.milagre}"

if __name__ == "__main__":
    clerigo = Clerigo("Petrus", 2000, 5, "Cura Maior")
    print(clerigo.mostrar_status())

    clerigo.set_estus(15)         # invalido -> mantem 5
    print(clerigo.mostrar_status())

    clerigo.set_estus(10)         # valido
    print(clerigo.mostrar_status())

    # acesso direto ao atributo privado -> AttributeError
    # (o Python renomeia __estus para _MortoVivo__estus)
    # print(clerigo.__estus)
