dim pin as integer = 4321
dim usuario as integer

input "Digite o PIN de acesso: "; usuario

while usuario <> pin
    print "PIN invalido. Tente novamente."
    input usuario
wend 

print "Transacao autorizada"
sleep