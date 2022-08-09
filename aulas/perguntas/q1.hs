import Data.List (groupBy, sortBy)
import Data.Map (toList, fromListWith)
{-
Uma plataforma de e-commerce deseja fazer uma análise sobre as páginas navegadas pelos clientes. Esta plataforma consegue manter as navegações de todos os seus clientes. Uma navegação nada mais é do que uma lista de pares onde cada par possui um nome de página e o tempo que o cliente passou naquela página. Exemplos de nome são "home", "busca", "produtoA", "produtoB", ..., "produtoN", "carrinho", "checkout", dentre outras. Desta forma, crie um programa em Haskell com as seguintes funções:

a) f1: recebe uma lista de navegações de páginas e deve retornar a página que se gasta mais tempo (as somas dos tempos nesta página é a maior de todas).

b) f2: recebe uma lista de navegações de páginas e deve retornar uma lista de pares onde cada par é composto por uma página e a média de tempo gasto nela.

c) f3: recebe uma lista de navegações de páginas e deve retornar a página que possui a maior média de tempo em relação as demais.

-}

type Navegacao = (String, Float)

-- a) f1: recebe uma lista de navegações de páginas e deve retornar a página que se gasta mais tempo (as somas dos tempos nesta página é a maior de todas).
-- f1 :: [Navegacao] -> Navegacao

-- b) f2: recebe uma lista de navegações de páginas e deve retornar uma lista de pares onde cada par é composto por uma página e a média de tempo gasto nela.
-- f2 :: [Navegacao] -> Navegacao

-- f3 :: [Navegacao] -> Navegacao

ordenaEagrupa :: [Navegacao] -> [[Navegacao]]
ordenaEagrupa l = groupBy (\(a, _) (b, _) -> a == b) (sortBy (\(a, _) (b, _) -> compare a b) l)

reduzir :: (Ord k, Num a) => [(k, a)] -> [(k, a)]
reduzir = toList . fromListWith (+)
