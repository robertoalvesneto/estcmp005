class MiniThread extends Thread {
    int n;

    MiniThread(int m) {
        n = m;
    }

    public void run() {
        do {
            yield();
            n--;
        } while (n > 0);
    }
}

public class App {
    public static void main(String[] args) throws Exception {
        int threads = 100000;
        int times = 10000;

        long tempoInicial = System.currentTimeMillis();

        for (int i = threads; i > 0; i--) {
            MiniThread t = new MiniThread(times);
            t.start();
        }

        long tempoFinal = System.currentTimeMillis();

        System.out.printf("%.3f ms%n", (tempoFinal - tempoInicial) / 1000d);
    }
}
