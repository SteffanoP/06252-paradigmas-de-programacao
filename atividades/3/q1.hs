-- Crie uma função "somaFats :: Int -> Int" que recebe um inteiro e deve retornar a soma dos fatoriais de 0 até n.
fat :: Int -> Int
fat 0 = 1
fat n = fat (n - 1) * n

somaFats :: Int -> Int
somaFats n | n == 0 = 1
           | otherwise = somaFats (n - 1) + fat n