{- 
Assumindo a estrutura de sinônimos abaixo:

type Nome = String
type Idade = Int
type Telefone = Int
type Pessoa = (Nome, Idade , Telefone)

Crie uma função que recebe quatro pessoas e deve retornar uma String contendo 
nome e telefone das pessoas cujas idades são maiores ou iguais a média das idades 
das quatro pessoas passadas como parâmetro.
-}
-- Estrutura
type Nome = String
type Idade = Int
type Telefone = Int
type Pessoa = (Nome, Idade , Telefone)

-- n -> nome
-- i -> idade
-- t -> telefone
getIdade :: Pessoa -> Int
getIdade (n, i, t) = i

media4Valores :: Int -> Int -> Int -> Int -> Float
media4Valores a b c d = fromIntegral(a + b + c + d) / 4

-- a,b,c,d -> pessoa
media4Pessoas :: Pessoa -> Pessoa -> Pessoa -> Pessoa -> Float
media4Pessoas a b c d = media4Valores (getIdade a) (getIdade b) (getIdade c) (getIdade d)

-- n -> nome
-- i -> idade
-- t -> telefone
imprimeNomeTelefone :: Pessoa -> String
imprimeNomeTelefone (n, i, t) = n ++ " " ++ show t ++ "\n"

-- p -> pessoa
-- m -> media
testaPessoaMedia :: Pessoa -> Float -> String
testaPessoaMedia p m | fromIntegral(getIdade p) >= m = imprimeNomeTelefone p
                     | otherwise = ""

-- Função Principal da questão
maioresMedia :: Pessoa -> Pessoa -> Pessoa -> Pessoa -> String
maioresMedia a b c d = testaPessoa a ++ testaPessoa b ++ testaPessoa c ++ testaPessoa d
    where media = media4Pessoas a b c d
          testaPessoa x = testaPessoaMedia x media
