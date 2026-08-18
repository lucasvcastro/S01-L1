dim distancia as integer
input "Qual a distancia percorrida? (em km)", distancia

dim tempo as integer
input "Quanto tempo foi necessario para completar a corrida? (em minutos)", tempo

dim pace as integer = tempo / distancia

print "Pace medio: ", pace
sleep