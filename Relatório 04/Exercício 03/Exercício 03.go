package main
import "fmt"

func gerarEscalaPlantao(n int) {
	dia := 1 

	fmt.Println("\n--- Escala de Plantao Tecnico ---")
	for i := 1; i <= n; i++ {
		fmt.Printf("Plantao %d: Dia %d do mes\n", i, dia)
		dia += 4 
	}
}

func main() {
	var quantidade int

	fmt.Print("Digite a quantidade de plantoes necessarios: ")
	fmt.Scanln(&quantidade)

	gerarEscalaPlantao(quantidade)
}