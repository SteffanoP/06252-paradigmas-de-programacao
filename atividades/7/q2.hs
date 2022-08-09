{-
Queremos descobrir quem são os servidores que recebem acima da média dos salários de outros servidores. Assim, crie uma função em Haskell que recebe uma lista de pares onde o primeiro elemento do par é uma string com o CPF do servidor e a segunda é um número real com o seu salário. Tal função deve retornar uma lista com os CPFs de servidores que recebem acima da média salarial de todos os servidores.

-}
type Cpf = String
type Salario = Float
type Servidor = (Cpf, Salario)

mediaSalarios :: [Salario] -> Salario
mediaSalarios l = sum l / fromIntegral (length l)

listarAcimaDaMedia :: [Servidor] -> [Cpf]
listarAcimaDaMedia l = map fst (filter (\ (_,x) -> x > media)  l)
  where
    media = mediaSalarios (map snd l)