class CoquetelAfterlife
  # nome pode ser lido de fora, mas nao pode ser alterado
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    # atribuicao direta, sem passar pelo setter
    @_preco = preco
  end

  # getter manual
  def preco
    @_preco
  end

  # setter manual: so aceita valores de 5 a 200
  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preco invalido!"
    end
  end

  # retorna (nao imprime) um texto com nome e preco
  def ficha
    "Drink: #{@nome} | Preco: #{@_preco} eddies"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  # reaproveita o texto do pai e acrescenta a lenda
  def ficha
    super + " | Em homenagem a: #{@lenda}"
  end
end

drinks = [
  CoquetelAfterlife.new("Cerveja Nuclear", 20),
  DrinkDeLenda.new("Johnny Silverhand", 150, "Johnny Silverhand, rockstar rebelde"),
  DrinkDeLenda.new("Dama de Ferro", 90, "Alt Cunningham, a maior netrunner")
]

drinks.each do |drink|
  puts drink.ficha
end

puts "-" * 40

# preco fora da faixa (500): deve exibir "Preco invalido!" e manter o valor
drinks[1].preco = 500
# preco dentro da faixa (80): deve ser aceito
drinks[1].preco = 80
puts drinks[1].ficha

# Item 6: tentar alterar o nome gera NoMethodError (undefined method `nome=')
# porque so existe attr_reader. Linha comentada para o programa voltar a rodar.
# drinks[0].nome = "Outro Nome"