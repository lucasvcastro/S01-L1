package main
import "fmt"

func main() {
	var trim1, trim2, trim3 int

	fmt.Print("Digite as vendas do primeiro trimestre: \n")
	fmt.Scanln(&trim1)

	fmt.Print("Digite as vendas do segundo trimestre: \n")
	fmt.Scanln(&trim2)

	fmt.Print("Digite as vendas do terceiro trimestre: \n")
	fmt.Scanln(&trim3)

	soma := trim1 + trim2 + trim3

	if soma < 100 {
		fmt.Println("Meta minima anual nao atingida!")
	} else {
		fmt.Printf("Total de vendas: %d unidades\n", soma)

		switch {
		case soma >= 250:
			fmt.Println("Classificacao: Categoria Top Seller")
		case soma >= 180:
			fmt.Println("Classificacao: Categoria Senior")
		default: 
			fmt.Println("Classificacao: Categoria Pleno")
		}
	}
}