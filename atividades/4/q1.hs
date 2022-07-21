{-
Usando a linguagem funcional Haskell, defina uma função chamada fTeste 
que recebe uma função f, uma lista de elementos do tipo a e uma outra
lista de elementos do tipo b, ambos genéricos. Sua função deve retornar
True caso ao aplicar a função f a cada um dos elementos da primeira lista
retorna o elemento correspondente na segunda lista. Por exemplo, ao 
aplicar fTeste f [2,5,23,1] [5,1,44,7] deve retornar True se f(2) = 5, 
f(5) = 1, f(23) = 44 e f(1) = 7 e False caso contrário.
-}

testeIndividual :: Eq a => (t -> a) -> t -> a -> Bool
testeIndividual fun a b = fun a == b

fTeste :: Eq b => (a -> b) -> [a] -> [b] -> Bool
fTeste f [] [] = True
fTeste f [] l = error "A segunda lista possui mais elementos do que a primeira (Lembre-se de usar uma função um para um)"
fTeste f l [] = error "A primeira lista possui mais elementos do que a segunda (Lembre-se de usar uma função um para um)"
fTeste f (a:as) (b:bs) | testeIndividual f a b = fTeste f as bs
                       | otherwise = False
