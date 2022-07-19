-- Crie uma função fatorial
fat :: Int -> Int
fat 0 = 1
fat n = fat (n - 1) * n

-- Crie uma função que compara se quatro valores são iguais
all4Equal a b c d = (a == b) && (b == c) && (c == d)

-- Crie uma função que retorna quantos argumentos são iguais
equal :: Int -> Int -> Int
equal a b | a == b = 1
          | otherwise = 0

equalCount :: Int -> Int -> Int -> Int
equalCount a b c = equal a b + equal b c + equal a c
