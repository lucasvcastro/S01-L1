# Classe abstrata: nao deve ser usada diretamente para interpretar
class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "Cada instrumentista deve implementar interpretar"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{nome} (#{instrumento}) toca #{peca} e conduz a melodia principal."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{nome} (#{instrumento}) toca #{peca} e acompanha o ritmo do solista."
  end
end

class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "O regente #{@nome} comeca a reger a peca #{peca}."
    @orquestra.each do |instrumentista|
      instrumentista.interpretar(peca)
    end
  end

  # retorna um novo array de textos com a classe e o nome de cada um
  def escalacao
    @orquestra.map do |instrumentista|
      "#{instrumentista.class} - #{instrumentista.nome}"
    end
  end
end

kousei = Solista.new("Kousei Arima", "piano")
kaori = Acompanhador.new("Kaori Miyazono", "violino")
regente = Regente.new("Sr. Takeshi")

regente.convocar(kousei)
regente.convocar(kaori)

regente.reger("Concerto para Piano e Orquestra")

puts "-" * 40
puts "Escalacao:"
regente.escalacao.each do |texto|
  puts texto
end

# Item 6: o objeto e criado normalmente, mas a chamada de interpretar
# levanta NotImplementedError. Linha comentada para o programa voltar a rodar.
generico = Instrumentista.new("Fulano", "flauta")
# generico.interpretar("Sonata")