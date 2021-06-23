module Main where
fib (0) = 0
fib (1) = 1
fib (n) = fib (n-1) + fib (n-2)


-- O(1.6^n)

main = do
    n <- readLn
    print(fib n)