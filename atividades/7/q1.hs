import Data.List (maximumBy, minimumBy)
import Data.Ord (comparing)
{-
Segundo Helder Nakaya, membro do comitê científico da SBI (Sociedade Brasileira de Infectologia), para medir a eficácia de uma vacina "o que se faz é comparar o número de infectados no grupo de controle - aquele que recebe placebo ou outra vacina que não é a que está sendo testada - , com o número de infectados no grupo que recebeu a vacina em desenvolvimento". Por exemplo, considerando 20% dos voluntários que receberam a vacina tiveram a doença e que 70% dos que receberam o placebo adoeceram, a conta a ser feita é a seguinte: um menos o valor resultante da divisão entre 20% e 70%. Neste caso hipotético, a eficácia é de 71,4%. Assim, crie um programa em Haskell que pede para o usuário digitar o caminho para um arquivo com dados de vacincas, em seguida, leia este arquivo e imprima na saída padrão o nome das vacinas e o seus percentuais de eficácia. Por último, seu programa deve imprimir a vacina com melhor resultado e a com o pior resultado. Assuma que cada linha do arquivo tem o seguinte formato: [nome da vacina];[percentual de vacinados que adoeceram];[percentual que receberam placebo que adoeceram]. Abaixo segue um exemplo de conteúdo do arquivo:

Pfizer;0.01;0.8

Astrazeneca;0.045;0.65

Moderna;0.03;0.087

SinoVac;0.2;0.7

Novavax;0.125;0.73
-}
data Vacina = Vacina {
    nome :: String,
    gvacinados :: Float,
    gplacebo :: Float,
    eficiencia :: Float
} deriving (Show)

getNome (Vacina n _ _ _) = n
getEficiencia (Vacina _ _ _ e) = e
getNomeEficienciaStr (Vacina n _ _ e) = n ++ " " ++ show (e*100) ++ "%"

-- COMO QUE NÃO EXISTE SPLIT EM HASKELL????
split :: Eq a => a -> [a] -> [[a]]
split d [] = []
split d s = x : split d (drop 1 y) where (x, y) = span (/= d) s

splitByComma = split ';'

calcEficacia v p = 1 - (v/p)

criaVacina :: [String] -> Vacina
criaVacina l | length l == 3 = Vacina (head l) (gv l) (gp l) (1 - (gv l/gp l))
             | otherwise = error "Formato de vacina desconhecido"
  where
    gv l = read (l!!1)
    gp l = read (l!!2)

imprimeVacina :: Vacina -> IO()
imprimeVacina vax = do putStrLn (getNomeEficienciaStr vax)

imprimeMaximo :: [Vacina] -> Vacina
imprimeMaximo = maximumBy (comparing getEficiencia)

imprimeMinimo :: [Vacina] -> Vacina
imprimeMinimo = minimumBy (comparing getEficiencia)

main = do print "Digite o caminho para o arquivo das vacinas.txt"
          path <- getLine
          file <- readFile path
          mapM imprimeVacina (vacinas file)
          putStrLn ("A melhor eficiência é: " ++ getNomeEficienciaStr (imprimeMaximo (vacinas file)))
          putStrLn ("A pior eficiência é: " ++ getNomeEficienciaStr (imprimeMinimo (vacinas file)))
            where 
                vacinas f = map (criaVacina . splitByComma) (lines f)

