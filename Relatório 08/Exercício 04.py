from abc import ABC, abstractmethod


class IUnidadeDeRede(ABC):
    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:
    def __init__(self, modelo):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):
    def __init__(self, nome, modelo_cyberdeck):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)  # composição

    def executar_invasao(self):
        print(f"Netrunner {self.nome} usa o cyberdeck {self.cyberdeck.modelo} "
              f"para quebrar o gelo (ICE) de um servidor.")


class DroneDeVigilancia(IUnidadeDeRede):
    def __init__(self, codigo):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"Drone {self.codigo} está interceptando o sinal da rede.")


class CelulaHacker:
    def __init__(self, nome, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self.membros = membros  # agregação

    def iniciar_ataque(self):
        print(f"Célula {self.nome} iniciando ataque!")
        for membro in self.membros:
            membro.executar_invasao()  # polimorfismo


if __name__ == "__main__":
    netrunner = OperadorNetrunner("V", "Militech Paraline")
    drone = DroneDeVigilancia("DRN-077")

    celula = CelulaHacker("Voodoo Boys", [netrunner, drone])
    celula.iniciar_ataque()

    # Classe abstrata não pode ser instanciada -> TypeError:
    # "Can't instantiate abstract class IUnidadeDeRede ..."
    # unidade = IUnidadeDeRede()
