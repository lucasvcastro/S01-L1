-- Show permite exibir com show/print; Eq permite comparar com ==
data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever a =
  cliente a ++ " | " ++ servico a ++ " | Etapa: " ++ show (etapa a)

-- devolve um atendimento NOVO; o original nao muda
concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

-- so os concluidos ja foram pagos
arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let a1 = Atendimento "Sem Rosto" "Banho de Ervas" 50.0 NaFila
      a2 = Atendimento "Deus do Rio" "Banho de Lama" 120.0 NoBanho
      a3 = Atendimento "Deus Rabanete" "Banho Termal" 80.0 NaFila
      original   = [a1, a2, a3]
      -- alguns, mas nao todos, passam por concluir
      atualizada = [concluir a1, a2, concluir a3]

  putStrLn "--- Lista original ---"
  mapM_ putStrLn (map descrever original)
  putStrLn ("Arrecadado: " ++ show (arrecadado original))

  putStrLn "--- Lista atualizada ---"
  mapM_ putStrLn (map descrever atualizada)
  putStrLn ("Arrecadado: " ++ show (arrecadado atualizada))