-- peso maximo (em kg) que a vassoura aguenta
pesoMaximo :: Double
pesoMaximo = 10.0

-- Item 7: em Haskell nao existe atribuicao, so definicao. Definir pesoMaximo
-- de novo e erro de COMPILACAO (declaracao duplicada), entao o programa nem
-- chega a rodar. Linha comentada para voltar a rodar.
-- pesoMaximo = 15.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " | Peso: " ++ show (peso e) ++ " kg | Frete: R$ " ++ show (frete e)

-- mantem so as encomendas que a vassoura aguenta
cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda "Padaria da Osono" 3.5 12.0
        , Encomenda "Pintor Ursula" 8.0 25.0
        , Encomenda "Senhora da Torre" 15.0 40.0
        , Encomenda "Relojoaria do Centro" 12.5 35.0
        , Encomenda "Tombo" 2.0 8.0
        ]

  putStrLn "--- Todas as encomendas ---"
  mapM_ putStrLn (map descrever encomendas)

  putStrLn "--- Encomendas que cabem na vassoura ---"
  mapM_ putStrLn (map descrever (cabemNaVassoura encomendas))

  putStrLn "--- Total de fretes das encomendas que cabem ---"
  print (totalDeFretes (cabemNaVassoura encomendas))