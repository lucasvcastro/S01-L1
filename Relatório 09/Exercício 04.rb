module Depoente
  def depor
    raise NotImplementedError, "Implementar depor na classe"
  end
end

# Implementacao pronta: usa o attr_reader :nome da classe que incluir
module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard."
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{nome} diz: vi um homem de casaco longo saindo pela porta dos fundos."
  end
end

class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  def initialize(nome, alibi)
    super(nome)
    @alibi = alibi
  end

  def depor
    puts "#{nome} diz: na hora do crime eu estava #{@alibi}."
  end
end

class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  # o envolvido ja vem pronto de fora (agregacao)
  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "Caso: #{@caso}"
    @envolvidos.each do |envolvido|
      envolvido.depor
    end
  end

  def acionar_scotland_yard
    detiveis = @envolvidos.select do |envolvido|
      envolvido.respond_to?(:ser_detido)
    end

    puts "Scotland Yard acionada:"
    detiveis.each do |envolvido|
      envolvido.ser_detido
    end
  end
end

testemunha = TestemunhaOcular.new("Sra. Hudson")
suspeito1 = SuspeitoDoCrime.new("Lord Blackwood", "jogando cartas no clube")
suspeito2 = SuspeitoDoCrime.new("James Moriarty", "lendo na biblioteca")

investigacao = Investigacao.new("O Misterio da Baker Street")
investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
puts "-" * 40
investigacao.acionar_scotland_yard