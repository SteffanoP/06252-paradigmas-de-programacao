resposta :: Int
resposta = 42

maiorQue :: Bool
maiorQue = resposta > 72

sim :: Bool
sim = True

-- Max(x,y)
maxi :: Int -> Int -> Int
maxi x y | x > y = x
         | x == y = x
         | otherwise = y

-- addDouble (x,y) = 2 * (x + y)
addDouble x y = 2 * (x + y)

-- fib (x) -- fibonacci
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

vendas :: Int -> Int
vendas 0 = 50
vendas 1 = 85
vendas 2 = 80
vendas 3 = 87
vendas 4 = 74

totalVendas :: Int -> Int
totalVendas n | n == 0 = vendas 0
              | otherwise = totalVendas (n - 1) + vendas n

