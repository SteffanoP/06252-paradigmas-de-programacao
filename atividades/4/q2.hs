{-
No mundo das artes marciais mistas (ou MMA) existe uma discussão de quem 
deve ser o melhor lutador(a) de todos considerando todas as classes de 
peso. Assim, vamos criar um ranking que deve ser calculado de acordo com
o cartel de cada um deles. Cada cartel contém a quantidade de vitórias,
a quantidade de derrotas, a quantidade de empates e a quantidade de lutas
sem resultado. As vitórias ainda podem ser por decisão dos juizes ou por 
nocaute/submissão. Considerando este elementos, vamos criar um ranking de
acordo com as regras de pontuação abaixo:

- Vitória por noucate/submissão = 5

- Vitória por decisão = 3

- Derrota = -2

- Sem resultado = 1

Desta forma, crie um programa em Haskell que recebe uma lista tuplas de 
cinco elementos (uma string e quatro inteiros) representando 
respectivamente: Nome do lutador, Vitorias Nocaute/Submissao, Vitorias 
Decisao, Derrotas, Sem Resultado. Cada tupla tupla representa um lutador.
Seu programa deve calcular o ranking de cada lutador e retornar uma String
com o nome do lutador de maior pontuação. 

OBS: Você pode consultar o site https://www.sherdog.com/ para testar seu 
programa com os carteis de alguns lutadores reais.
-}

type Nome = String
type VitoriaNocaute = Int
type VitoriaDecisao = Int
type Derrota = Int
type SemResultado = Int
type Lutador = (Nome, VitoriaNocaute, VitoriaDecisao, Derrota, SemResultado)

calculaScore :: Lutador -> (Nome, Int)
calculaScore (n, vn, vd, d, s) = (n, (vn * scorevn) + (vd * scorevd) + (d * scored) + (s * scores))
    where
        scorevn = 5
        scorevd = 3
        scored = -2
        scores = 1

ranker :: [(Nome, Int)] -> (Nome, Int)
ranker [] = error "Não há lutadores na lista"
ranker [x] = x
ranker (a:as) | snd a > snd (ranker as) = a
              | otherwise = ranker as

rankingMelhorLutador :: [Lutador] -> Nome
rankingMelhorLutador n = fst (ranker (map calculaScore n))