-- nome, preco, intensidade (campos posicionais)
data Cafe = Cafe String Double Int

-- retorna (nao imprime) o texto com nome e preco
descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco

-- guards testados de cima para baixo
forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

-- o leite custa 2.0 a mais
precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let cafeForte       = Cafe "Expresso Phantom" 14.0 9
      cafeEquilibrado = Cafe "Blend da Casa" 12.5 6
      cafeSuave       = Cafe "Cafe com Canela" 11.0 3

  putStrLn "--- Cafes do dia ---"
  putStrLn (descrever cafeForte ++ " | Forca: " ++ forca cafeForte)
  putStrLn (descrever cafeEquilibrado ++ " | Forca: " ++ forca cafeEquilibrado)
  putStrLn (descrever cafeSuave ++ " | Forca: " ++ forca cafeSuave)

  putStrLn "--- Preco do Blend da Casa ---"
  putStrLn "Com leite:"
  print (precoDoPedido True cafeEquilibrado)
  putStrLn "Sem leite:"
  print (precoDoPedido False cafeEquilibrado)