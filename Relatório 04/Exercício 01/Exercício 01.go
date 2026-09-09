package main
import "fmt"

func ValidarCodigoRastreio(codigo string) (bool, string) {
	if len(codigo) == 10 {
		return true, "Codigo de rastreio registrado no sistema!"
	} else {
		return false, "Erro: O codigo de rastreio deve ter exatamente 10 caracteres."
	}
}

func main() {
	var codigo string
	var mensagem string
	valido := false

	for !valido {
		fmt.Print("Digite o codigo de rastreio: ")
		fmt.Scanln(&codigo)

		valido, mensagem = ValidarCodigoRastreio(codigo)
		fmt.Println(mensagem)
	}
}