{-
Segundo Helder Nakaya, membro do comitê científico da SBI (Sociedade Brasileira de Infectologia), para medir a eficácia de uma vacina "o que se faz é comparar o número de infectados no grupo de controle - aquele que recebe placebo ou outra vacina que não é a que está sendo testada - , com o número de infectados no grupo que recebeu a vacina em desenvolvimento". Por exemplo, considerando 20% dos voluntários que receberam a vacina tiveram a doença, e que 70% dos que receberam o placebo adoeceram, a conta a ser feita é a seguinte: um menos o valor resultante da divisão de 20% por 70%. Neste caso hipotético, a eficácia é de 71,4%. Assim, crie um programa em Haskell que lê do usuário o nome da vacina, a porcentagem de pessoas que se vacinaram e tiveram a doença, e a porcentagem dos que tomaram placebo e tiveram a doença. O processo se repete até que se digite a string vazia para o nome da vacina. Por último, seu programa deve imprimir a média, considerando todas as vacinas lidas do usuário, dos que tomaram a vacina e se infectaram, e também a média dos que tomaram placebo e se infectaram.
-}

data Vacina = Vacina
    { nome :: String,
      gcontrole :: Float,
      gplacebo :: Float
}

getGControle :: Vacina -> Float
getGControle (Vacina _ gcontrole _) = gcontrole

getGPlacebo :: Vacina -> Float
getGPlacebo (Vacina _ _ gplacebo) = gplacebo

calcularMedias :: [Vacina] -> (Float,Float)
calcularMedias [] = error "Lista de vacinas não especificada"
calcularMedias v = (media (map getGControle v), media (map getGPlacebo v))
    where
        media l = sum l / fromIntegral (length l)

criaVacina :: String -> Vacina
criaVacina str | length l == 3 = Vacina nome gcontrole gplacebo
               | otherwise = error "Formato de vacina inválido!"
    where
        l = words str
        nome = head l
        gcontrole = read (head (tail l))
        gplacebo = read (head (tail (tail l)))

coletaVacinas :: [Vacina] -> String -> IO ()
coletaVacinas vacinas nova_vacina | nova_vacina == "" = putStrLn (show (calcularMedias vacinas))
                                  | otherwise = do x <- getLine
                                                   if nova_vacina == " " then coletaVacinas [] x
                                                   else coletaVacinas (vacinas ++ [criaVacina nova_vacina]) x

iniciaColetaVacinas = coletaVacinas [] " "