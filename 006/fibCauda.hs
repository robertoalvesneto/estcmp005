module Main where
fib n = fibAux n 0 1

fibAux n v1 v2
    | n == 0 = v1
    | n == 1 = v2
    | n > 0 = fibAux (n-1) v2 (v2+v1)

main = do
    n <- readLn
    print(fib n)