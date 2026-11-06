data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

-- caso [] : caderno vazio; caso (e:_) : pega o primeiro e ignora o resto
esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno esta vazio."
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

-- recursao: caso base + caso recursivo
contarEsbocos :: [Esboco] -> Int
contarEsbocos []     = 0
contarEsbocos (_:xs) = 1 + contarEsbocos xs

-- soma as horas do primeiro esboco ao total do resto
horasDesenhando :: [Esboco] -> Int
horasDesenhando []     = 0
horasDesenhando (e:xs) = horas e + horasDesenhando xs

main :: IO ()
main = do
  let caderno =
        [ Esboco "Ruinas do Castelo" "nanquim" 5
        , Esboco "Criatura da Neblina" "grafite" 3
        , Esboco "Floresta Sombria" "carvao" 8
        ]

  putStrLn ("Mais recente: " ++ esbocoMaisRecente caderno)
  putStrLn ("Total de esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Total de horas: " ++ show (horasDesenhando caderno))
  putStrLn ("Caderno vazio: " ++ esbocoMaisRecente [])

  putStrLn "--- Caderno novo (esboco na frente do anterior) ---"
  let cadernoNovo = Esboco "Torre Abandonada" "nanquim" 4 : caderno

  putStrLn ("Mais recente do novo: " ++ esbocoMaisRecente cadernoNovo)
  putStrLn ("Esbocos no novo: " ++ show (contarEsbocos cadernoNovo))
  putStrLn ("Mais recente do anterior: " ++ esbocoMaisRecente caderno)
  putStrLn ("Esbocos no anterior: " ++ show (contarEsbocos caderno))

  -- Item 7: head em lista vazia COMPILA, mas quebra na execucao
  -- (Prelude.head: empty list). Linha comentada para voltar a rodar.
  let cadernoVazio = [] :: [Esboco]
  -- putStrLn (titulo (head cadernoVazio))
  putStrLn ("Esbocos no caderno vazio: " ++ show (contarEsbocos cadernoVazio))