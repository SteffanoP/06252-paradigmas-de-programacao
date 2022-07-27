data Expr = Lit Int | Add Expr Expr | Sub Expr Expr

eval :: Expr -> Int
eval (Lit n) = n
eval (Add e1 e2) = ( eval e1 ) + ( eval e2 )
eval (Sub e1 e2) = ( eval e1 ) - ( eval e2 )

showExpr :: Expr -> String
showExpr (Lit n) = show n
showExpr (Add a b) = showExpr a ++ " + " ++ showExpr b
showExpr (Sub a b) = showExpr a ++ " - " ++ showExpr b

data ListaLigada t = Nil | Cons t (ListaLigada t)

toList :: ListaLigada t -> [t]
toList Nil = []
toList (Cons a b) = a : toList b

fromList :: [t] -> ListaLigada t
fromList = foldr Cons Nil

data Tree t = NilT | Node t (Tree t) (Tree t)

depth :: Tree t -> Int
depth NilT = 0
depth (Node t a b) = 1 + max (depth a) (depth b)

collapse :: Tree t -> [t]
collapse (Node t a b) = 