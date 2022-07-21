import Data.Char (isAlpha, ord)
rankingMusica ls = [sum (map ord (filter isAlpha l)) | l <- ls]
