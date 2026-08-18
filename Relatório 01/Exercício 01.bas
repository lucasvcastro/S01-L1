dim peso as integer
dim agua as integer

input "Qual e o seu peso? (em kg)", peso

input "Quantos ml de agua vc bebeu hoje?", agua

dim meta as integer
meta = peso * 35

if agua >= meta then
    print "Meta atingida"
else
    print "Meta nao atingida"
end if
sleep