{-
Uma das principais dúvidas de quem está começando a criar cães é a quantidade de ração diária que deve ser oferecida aos animais. A medida a ser oferecida depende do peso e do porte do cachorro. Abaixo seguem os percentuais:

Porte Miniatura I (até 3 kg): 7% do peso
Porte Miniatura II (de 3 a 5 kg): 6% do peso
Porte Pequeno (de 5 a 10 kg): 4% do peso
Porte Médio (de 10 a 22 kg): 5% do peso
Porte Grande (de 22 a 40 kg): 4,5% do peso
Porte Gigante (40kg ou mais) : 4% do peso

Assim, crie um programa em Haskell que deve receber da entrada padrão (perguntar ao usuário) o porte e o peso de um cão e deve retornar a quantidade em kilos diária que deve ser oferecida de ração. Caso a quantidade de kilos não corresponda ao porte informado, o programa deve indicar o erro e pedir que o usuário digite novamente os dados.
-}

testaPorte :: String -> Float -> Bool
testaPorte por pes | (por == "Miniatura I") && (pes <= 3 && pes > 0) = True
testaPorte por pes | (por == "Miniatura II") && (pes <= 5 && pes > 3) = True
testaPorte por pes | (por == "Pequeno") && (pes <= 10 && pes > 5) = True
testaPorte por pes | (por == "Medio") && (pes <= 22 && pes > 10) = True
testaPorte por pes | (por == "Grande") && (pes <= 40 && pes > 22) = True
testaPorte por pes | (por == "Gigante") && (pes > 40) = True
testaPorte por pes | otherwise = False


calculaKilos :: String -> Float -> Float
calculaKilos por pes | (por == "Miniatura I") = 0.07 * pes
calculaKilos por pes | (por == "Miniatura II") = 0.06 * pes
calculaKilos por pes | (por == "Pequeno") = 0.04 * pes
calculaKilos por pes | (por == "Medio") = 0.05 * pes
calculaKilos por pes | (por == "Grande") = 0.045 * pes
calculaKilos por pes | (por == "Gigante") = 0.04 * pes
calculaKilos por pes | otherwise = 0

main :: IO()
main = do putStrLn "Olá usuário! Me diga qual o porte do seu cão?"
          porte <- getLine
          putStrLn "Agora me diga o peso do cão" 
          peso <- readLn :: IO Float
          if testaPorte porte peso 
            then
                do 
                putStrLn "O peso para o porte do seu cão está correto"
                print ("A quantidade em kilos diaria que deve ser oferecida de racao devera ser de " ++ show (calculaKilos porte peso) ++ " kgs.")
            else 
                putStrLn "O peso para o porte do seu cão está incorreto"