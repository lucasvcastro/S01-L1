class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail: #{mensagem}"
    puts "Mensagem enviada para o passado!"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    # o PhoneWave nasce dentro do laboratorio (composicao)
    @phonewave = PhoneWave.new
    @membros = []
  end

  # o membro ja vem pronto de fora (agregacao)
  def admitir(membro)
    @membros << membro
    puts "Novo membro admitido: Lab Mem #{membro.numero} - #{membro.nome}"
  end

  def experimento(mensagem)
    puts "Iniciando experimento. Membros presentes:"
    @membros.each do |membro|
      puts "Lab Mem #{membro.numero} - #{membro.nome}"
    end
    @phonewave.enviar_dmail(mensagem)
  end
end

# membros criados ANTES do laboratorio: existem independentemente dele
okabe = MembroDoLab.new(1, "Rintaro Okabe")
mayuri = MembroDoLab.new(2, "Mayuri Shiina")

lab = LaboratorioDeGadgets.new
lab.admitir(okabe)
lab.admitir(mayuri)

lab.experimento("El Psy Kongroo")

# COMPOSICAO x AGREGACAO neste programa:
# - Composicao: o PhoneWave e criado dentro do initialize do
#   LaboratorioDeGadgets (PhoneWave.new). Ele pertence ao laboratorio e so
#   existe nele: se o laboratorio deixar de existir, o PhoneWave vai junto.
#   A dependencia e total.
# - Agregacao: os MembroDoLab sao criados fora (okabe e mayuri) e apenas
#   recebidos pelo metodo admitir. O laboratorio guarda so uma referencia,
#   entao os membros continuam existindo mesmo sem o laboratorio.
#   A ligacao e fraca.
