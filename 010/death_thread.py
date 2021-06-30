from threading import Thread
import time

def mini_thread(times):
    for i in range(times):
        time.sleep(0)
        
def death(n, m):
    threads = n
    times = m
    for i in range(threads):
        thread = Thread(target=mini_thread, args=[times])
        thread.start()

# death(100, 100)
# death(1000, 1000)
# death(10000, 1000)
# death(100000, 10000)

inicio = time.time()
death(100000, 10000)
fim = time.time()
print(fim - inicio)