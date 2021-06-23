module Main where
fib = 0 : 1 : zipWith (+) fib (tail fib)

main = do
    n <- readLn
    print(fib !! n)


-- para pegar todos os valores ate n:    take n fibs


-- para pegar somente o valor de n:      fibs !! n
--   (percorre todos do msm jeito)


-- O(n^2)